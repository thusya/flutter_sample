import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../bottom_sheet.dart';
import '../widgets/diary_card.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<DiaryCard> diaryCards = [];
  @override
  void initState() {
    super.initState();
    // Receive data from the native code
    _receiveDataFromNative();
  }

// Receive data from the native code
  Future<void> _receiveDataFromNative() async {
    dynamic receivedData = await platform.invokeMethod('getDiaryDetails');
    setState(() {
      List<dynamic> dataList = jsonDecode(receivedData);
      diaryCards = dataList
          .map((data) => DiaryCard.fromJson(data as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diary"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: diaryCards,
          ),
        ),
      ),
    );
  }
}

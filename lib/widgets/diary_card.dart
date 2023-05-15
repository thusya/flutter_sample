import 'dart:math';

import 'package:flutter/material.dart';
import '../HomeTabBar/diary_details.dart';

class DiaryCard extends StatefulWidget {
  const DiaryCard({
    required this.cardColor,
    required this.cardTitle,
    required this.subDiary,
    Key? key,
  }) : super(key: key);

  final String cardColor;
  final String cardTitle;
  final List<DiarySubCard> subDiary;

  @override
  State<DiaryCard> createState() => _DiaryCardState();

  static DiaryCard fromJson(Map<String, dynamic> json) {
    final cardColor = json['cardColor'];
    final cardTitle = json['cardTitle'];

    List<DiarySubCard> subDiary = [];
    if (json['subDiary'] is List<dynamic>) {
      subDiary = List<DiarySubCard>.from(json['subDiary']
          .map((subCardJson) => DiarySubCard.fromJson(subCardJson)));
    }

    return DiaryCard(
      cardColor: cardColor,
      cardTitle: cardTitle,
      subDiary: subDiary,
    );
  }
}

class DiarySubCard {
  final String cardTitle;
  final String? imageUrl;
  final String description;

  DiarySubCard(
      {required this.cardTitle, this.imageUrl, required this.description});

  factory DiarySubCard.fromJson(Map<String, dynamic> json) {
    print(json);
    final cardTitle = json['cardTitle'];
    final imageUrl = json['imageUrl'];
    final description = json['description'];

    return DiarySubCard(
      cardTitle: cardTitle,
      imageUrl: imageUrl,
      description: description,
    );
  }
}

class _DiaryCardState extends State<DiaryCard> {
  bool isExpanded = true;

  Color generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  // When row is clicked
  void handleRowTap(String title, String description, String? imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DiaryDetailPage(
          title: title,
          imageUrl: imageUrl,
          discription: description,
        ),
      ),
    );
  }

  Color hexToColor(String hexString) {
    String formattedHexString = hexString.replaceAll('#', '');
    int hexValue = int.parse(formattedHexString, radix: 16);
    Color color = Color(hexValue + 0xFF000000);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: !isExpanded
                ? Colors.transparent
                : hexToColor(widget.cardColor.replaceAll("#", ""))),
        child: Card(
          shadowColor: Colors.black,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: !isExpanded
              ? hexToColor(widget.cardColor.replaceAll("#", ""))
              : null,
          child: AnimatedCrossFade(
            firstChild: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Column(
                children: [
                  ListTile(
                    tileColor: isExpanded
                        ? hexToColor(widget.cardColor.replaceAll("#", ""))
                        : null,
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    title: Text(
                      widget.cardTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      isExpanded ? Icons.remove : Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            secondChild: GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    tileColor: isExpanded
                        ? hexToColor(widget.cardColor.replaceAll("#", ""))
                        : null,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    title: Text(
                      widget.cardTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      isExpanded ? Icons.remove : Icons.add,
                      color: Colors.black,
                    ),
                  ),
                  if (isExpanded)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.subDiary.length,
                      itemBuilder: (BuildContext context, int index) {
                        final singleSubDiary = widget.subDiary[index];
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: generateRandomColor(),
                              child: const Icon(
                                Icons.info,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              handleRowTap(
                                  singleSubDiary.cardTitle,
                                  singleSubDiary.description,
                                  singleSubDiary.imageUrl);
                            },
                            title: GestureDetector(
                              onTap: () {
                                // Handle left side text tap
                              },
                              child: Text(
                                singleSubDiary.cardTitle,
                              ),
                            ),
                            trailing: const Icon(Icons.keyboard_arrow_right),
                          ),
                        );
                      },
                    )
                ],
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      ),
    );
  }
}

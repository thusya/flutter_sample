import 'package:flutter/material.dart';
import 'package:method_channel/HomeTabBar/diary.dart';
import 'location_tracker.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [
    const DiaryScreen(),
    const LocationTracker(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
    );
  }
}

import 'package:e_book/screens/categories.dart';

import 'package:e_book/screens/home_page.dart';

import 'package:e_book/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPageIndex = 0;

  void onSelectTab(int index) {
    if (_selectedPageIndex == index) {
      return;
    }
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedPageIndex, children: [
        HomePage(),
        Categories(),
        SettingsScreen(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings'),
        ],
        currentIndex: _selectedPageIndex,
        onTap: onSelectTab,
      ),
    );
  }
}

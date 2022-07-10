import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/bar_item_page.dart';
import 'package:travel_app/pages/nav_pages/my_page.dart';
import 'package:travel_app/pages/nav_pages/search_page.dart';

import '../home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 5,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.apps)), //0
          BottomNavigationBarItem(
              label: 'Bar', icon: Icon(Icons.bar_chart_rounded)), //1
          BottomNavigationBarItem(
              label: 'Search', icon: Icon(Icons.search_rounded)), //2
          BottomNavigationBarItem(label: 'My', icon: Icon(Icons.person)), //3
        ],
      ),
    );
  }
}

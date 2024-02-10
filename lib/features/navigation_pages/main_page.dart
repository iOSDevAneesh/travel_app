import 'package:flutter/material.dart';
import 'package:travel_buddy/features/navigation_pages/bar_item.dart';
import 'package:travel_buddy/features/navigation_pages/home_page.dart';
import 'package:travel_buddy/features/navigation_pages/my_page.dart';
import 'package:travel_buddy/features/navigation_pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void _ontTap(int index) {
    setState(() {
      currentIndex = index;
      print("currentIndex-$currentIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const BarItemPage(),
      const SearchPage(),
      const MyPage(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: _ontTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Bar"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me")
        ],
      ),
    );
  }
}

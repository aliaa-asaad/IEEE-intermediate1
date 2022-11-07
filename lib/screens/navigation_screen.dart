import 'package:flutter/material.dart';
import 'package:intermediate1/screens/favorite_screen.dart';
import 'package:intermediate1/screens/home/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<Map<String, dynamic>> _pages = [
    {'page': Home(), 'title': 'Home'},
    {'page': FavoriteScreen(), 'title': 'Favorite'},
  ];

  int _selectedPageIndex = 0;

  Index(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff02947D),
        unselectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        onTap: Index,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.favorite_border),
              label: 'Favorite'),
        ],
      ),
    );
  }
}

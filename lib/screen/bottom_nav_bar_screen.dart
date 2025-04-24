import 'package:flutter/material.dart';
import 'package:interview/screen/category_screen.dart';
import 'package:interview/screen/home_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  //------------------------ variable ---------------//
  int selectedIndex = 0;

  List<Widget> screen = [
    HomeScreen(),
    CategoryScreen(),
    Center(child: Text("3")),
    Center(child: Text("4")),
    Center(child: Text("5")),
  ];

  // //------------------------- ui ---------------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey, // 👈 set unselected (default) color
        showUnselectedLabels: true,       // 👈 always show labels
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scale),
            label: 'Sale',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

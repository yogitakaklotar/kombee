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
    Center(child: Column(
        mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.travel_explore),
        SizedBox(height: 10,),
        Text("corate"),

      ],
    )),
    Center(child:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      Icon(Icons.flash_on),
        SizedBox(height: 10,),
        Text("Sale"),

      ],
    )),
    Center(child: Column(
        mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.more_horiz),
        SizedBox(height: 10,),
        Text("More"),

      ],
    )),
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
        unselectedItemColor: Colors.grey, 
        showUnselectedLabels: true,      
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore),
            label: 'corate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
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

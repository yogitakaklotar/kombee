import 'package:flutter/material.dart';
import 'package:interview/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'screen/bottom_nav_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>.value(value: HomeProvider())
      ],
      child: MaterialApp(
      
        debugShowCheckedModeBanner: false,
      home: BottomNavBarScreen(),
      ),
    );
  }
}


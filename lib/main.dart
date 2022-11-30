import 'package:flutter/material.dart';

import 'package:flutter_application_1/screens/blue_screen.dart';
import 'package:flutter_application_1/screens/green_screen.dart';
import 'package:flutter_application_1/screens/red_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigatorPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key, required this.title});

  final String title;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        children: const [
          BlueScreen(),
          GreenScreen(),
          RedScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.adb_rounded), label: "blue"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_rounded), label: "green"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_sharp), label: "red"),
        ],
        onTap: (newIndex) {
          pageController.animateToPage(newIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}

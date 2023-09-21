import 'package:bottom_navigation_bars/constants.dart';
import 'package:flutter/material.dart';
import 'designs/designs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CustomBottomNavigationItem> navigationBarItems = [
    CustomBottomNavigationItem(iconPath: Constants.home, label: "Home"),
    CustomBottomNavigationItem(iconPath: Constants.search, label: "Search"),
    CustomBottomNavigationItem(iconPath: Constants.create, label: "Create"),
    CustomBottomNavigationItem(
        iconPath: Constants.notification, label: "Notification"),
    CustomBottomNavigationItem(iconPath: Constants.settings, label: "Settings"),
  ];
  int selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Design3(
          items: navigationBarItems,
          selectedIndex: selectedIndex,
          onSelected: (index) {
            setState(() {
              selectedIndex = index;
              _pageController.jumpToPage(index);
            });
          }),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          5,
          (index) => Container(
            alignment: Alignment.center,
            child: Text(
              "Navbar Design 1\nPage ${index + 1}",
              textAlign: TextAlign.center,
            ),
          ),
        ), //
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final String label;
  final String iconPath;

  CustomBottomNavigationItem({
    required this.iconPath,
    required this.label,
  });
}

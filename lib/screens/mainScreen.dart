import 'package:cross_platform_app/constants.dart';
import 'package:cross_platform_app/screens/featured.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> widgetsList = [
    const Featured(),
    const Featured(),
    const Featured(),
    const Featured(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Featured',
                icon: Icon(Icons.featured_play_list_outlined, color: kblue),
                activeIcon: Icon(
                  Icons.featured_play_list,
                  color: kblue,
                )),
            BottomNavigationBarItem(
                label: 'My learning',
                icon: Icon(
                  Icons.data_thresholding_outlined,
                  color: kblue,
                ),
                activeIcon: Icon(
                  Icons.data_thresholding,
                  color: kblue,
                )),
            BottomNavigationBarItem(
                label: 'Wishlist',
                icon: Icon(Icons.favorite_outline_outlined, color: kblue),
                activeIcon: Icon(
                  Icons.favorite,
                  color: kblue,
                )),
            BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(
                  Icons.settings_suggest_outlined,
                  color: kblue,
                ),
                activeIcon: Icon(
                  Icons.settings_suggest,
                  color: kblue,
                )),
          ]),
    );
  }
}

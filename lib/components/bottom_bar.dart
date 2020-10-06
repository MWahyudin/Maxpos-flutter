import 'package:api/Screens/Menu/Submenu/home_screen.dart';
import 'package:api/Screens/Menu/Submenu/profile_screen.dart';
import 'package:api/Screens/Menu/Submenu/setting_screen.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatefulWidget {
  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int selectedpage = 0;

  final _pageOption = [HomeScreen(), ProfilScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _pageOption[selectedpage],
      bottomNavigationBar: CircleBottomNavigation(
        circleColor: Colors.red[100],
        activeIconColor: Colors.red,
        inactiveIconColor: Colors.red[100],
        tabs: [
          TabData(icon: Icons.home, title: "Home"),
          TabData(icon: Icons.person, title: "Profile"),
          TabData(icon: Icons.settings, title: "Setting"),
        ],
        // onTabChangedListener: null,
        initialSelection: selectedpage,
        onTabChangedListener: (index) => setState(() => selectedpage = index),
      ),
    );
  }
}

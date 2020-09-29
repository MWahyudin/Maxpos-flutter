import 'package:api/Screens/Menu/Submenu/home_screen.dart';
import 'package:api/Screens/Menu/Submenu/produk_screen.dart';
import 'package:api/Screens/Menu/Submenu/profile_screen.dart';
import 'package:api/Screens/Menu/Submenu/setting_screen.dart';
import 'package:api/constant.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedpage = 0;
  FSBStatus drawerStatus;
  final _pageOption = [
    HomeScreen(),
    ProfilScreen(),
    ProdukScreen(),
    SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //  backgroundColor: Hexcolor('#f50c14'),
         backgroundColor: Colors.transparent,
         elevation: 0,
        // title: Text(
        //   "Menu Maxpos",
        // ),
      ),
      extendBodyBehindAppBar: true,
      body: _pageOption[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor:Hexcolor('#f50c14'),
          // type: BottomNavigationBarType.fixed,
        items: [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.person, title: "Profile"),
          TabItem(icon: Icons.shopping_cart, title: "Produk"),
          TabItem(icon: Icons.settings, title: "Setting"),
        ],
        initialActiveIndex: selectedpage,
        onTap: (int index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}

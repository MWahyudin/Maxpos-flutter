import 'package:api/Screens/Menu/Submenu/home_screen.dart';
import 'package:api/Screens/Menu/Submenu/profile_screen.dart';
import 'package:api/Screens/Menu/Submenu/setting_screen.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({Key key, this.token}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedpage = 0;
  // String jwt = token;

  String getJwt() {
    String value = widget.token;
    print(value);
  }

  @override
  void initState() {
    _getToken().then((value) {
      // print(token);
      print(value);
      // widget.token;
    });
    super.initState();
  }

  Future _getToken() async {
    await Future.delayed(Duration(seconds: 1));
    String value = widget.token;
    // String value = await storage.read(key: token);

    return value;
  }

  // FSBStatus drawerStatus;
  // var jwt = token;
  @override
  Widget build(BuildContext context) {
    var tokenjwt = 'helllo';
    print(tokenjwt);

    final _pageOption = [
      HomeScreen(
        token: tokenjwt, 
      ),
      ProfilScreen(),
      SettingScreen()
    ];

    return Scaffold(
      body: _pageOption[selectedpage],
      bottomNavigationBar: CircleBottomNavigation(
        // body: _pageOption[selectedpage],
        circleColor: Colors.red[100],
        activeIconColor: Colors.red,
        inactiveIconColor: Colors.red[100],
        initialSelection: selectedpage,
        // style: TabStyle.flip,
        // backgroundColor:Hexcolor('#f50c14'),
        // type: BottomNavigationBarType.fixed,
        tabs: [
          TabData(icon: Icons.home, title: "Home"),
          TabData(icon: Icons.person, title: "Profile"),
          TabData(icon: Icons.settings, title: "Setting"),
        ],
        // initialActiveIndex: selectedpage,
        // onTap: (int index) {
        //   setState(() {
        //     selectedpage = index;
        //   });
        // },
        onTabChangedListener: (index) => setState(() => selectedpage = index),
      ),
    );
  }
}

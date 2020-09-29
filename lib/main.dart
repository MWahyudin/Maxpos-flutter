import 'package:api/Screens/Slider/components/body.dart';
import 'package:api/constant.dart';
import 'package:api/Screens/Slider/components/slider.dart';
import 'package:flutter/material.dart';

import 'Screens/Welcome/welcome_screen.dart';

// void main() {
//   // runApp(MyApp());

// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Maxpos Auth',
//       theme: ThemeData(
//         primaryColor: kPrimaryColor,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: WelcomeScreen(),
//     );
//   }
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Body(),
    );
  }
}
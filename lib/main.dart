
import 'package:api/components/splash_screen.dart';
import 'package:api/components/splash_screen_slider.dart';
import 'package:api/user_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  // runApp(new MyApp())
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
  // _MyAppState createState() => new _MyAppState();
}



class _MyAppState extends State<MyApp> {
  bool isInstalled = false;

  _MyAppState() {
    MySharedPreferences.instance
        .getBooleanValue("isfirstRun")
        .then((value) => setState(() {
              isInstalled = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maxpos',
      home: isInstalled ? SplashScreen() : SplashScreenSlider(),
    );
  }
}

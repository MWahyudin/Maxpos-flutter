import 'package:api/Screens/Slider/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:custom_splash/custom_splash.dart';

class SplashScreenSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maxpos',
      debugShowCheckedModeBanner: false,
      home: CustomSplash(
        imagePath: 'assets/images/logo.png',
        backGroundColor: Colors.white,
        // backGroundColor: Color(0xfffc6042),
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: SliderScreen(),
        // customFunction: duringSplash,
        duration: 3000,
        type: CustomSplashType.StaticDuration,
      ),
    );
    // outputAndHome: op,
  }
}

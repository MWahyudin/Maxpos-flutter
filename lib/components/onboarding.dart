import 'package:flutter/material.dart';

import 'package:api/Screens/Slider/slider_screen.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  final Function press;

  const OnBoarding({Key key, this.press}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: Text(
           "Home",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

import 'package:api/Screens/Slider/slider_screen.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';

class HaveAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const HaveAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Belum punya akun ? " : "Sudah punya akun ? ",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Daftar sekarang" : "Login akun",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

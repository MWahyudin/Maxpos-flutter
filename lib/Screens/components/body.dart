import 'package:api/Screens/Login/login_screen.dart';
import 'package:api/Screens/Register/register_screen.dart';
import 'package:api/Screens/components/background.dart';
import 'package:api/components/rounded_button.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Selamat datang di Maxpos",
              style: GoogleFonts.meriendaOne(
                  textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Hexcolor('#f0787d'))),
            ),
            SizedBox(height: size.height * 0.04),
            SvgPicture.asset(
              "assets/icons/shopping.svg",
              height: size.height * 0.4,
            ),
            SizedBox(height: size.height * 0.02),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "REGISTER",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

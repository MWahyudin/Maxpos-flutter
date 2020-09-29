import 'package:api/Screens/Login/login_screen.dart';
import 'package:api/Screens/Register/components/background.dart';
import 'package:api/Screens/Slider/slider_screen.dart';
import 'package:api/components/have_account_check.dart';
import 'package:api/components/onboarding.dart';
import 'package:api/components/rounded_button.dart';
import 'package:api/components/rounded_input_field.dart';
import 'package:api/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Register ...",
              style: GoogleFonts.openSansCondensed(
                  textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800])),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/register.svg",
              height: size.height * 0.35,
            ),
            // RoundedInputField(
            //   hintText: "Masukan Nama Lengkap",
            //   icon: Icons.person,
            // ),
            RoundedInputField(
              hintText: "Masukan Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "DAFTAR",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),

            HaveAccountCheck(
              login: false,
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
            SizedBox(
              height: 10,
            ),
            OnBoarding(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SliderScreen();
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

class Hexcolor {}

Future _doLogin() async {}

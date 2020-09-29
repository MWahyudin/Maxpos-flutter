import 'dart:convert';

import 'package:api/Screens/Login/components/background.dart';
import 'package:api/Screens/Menu/Submenu/home_screen.dart';
import 'package:api/Screens/Menu/body.dart';
import 'package:api/Screens/Register/register_screen.dart';
import 'package:api/Screens/Slider/slider_screen.dart';
import 'package:api/components/have_account_check.dart';
import 'package:api/components/onboarding.dart';
import 'package:api/components/rounded_button.dart';
import 'package:api/components/rounded_input_field.dart';
import 'package:api/components/rounded_password_field.dart';
import 'package:api/components/text_field_container.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  // const Body({
  //   Key key,
  // }) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Body> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  signIn(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Error",
        desc: "Email & password harus di isi",
        buttons: [
          DialogButton(
            child: Text(
              "Kembali",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Color.fromRGBO(0, 179, 134, 1.0),
          ),
        ],
      ).show();
    } else {
      String url = "http://apikompag.maxproitsolution.com/api/login";
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      Map body = {"email": email, "password": password};
      var jsonResponse;
      var res = await http.post(url, body: body);
      if (res.statusCode == 200) {
        // print("ok login");
        // // print("hasil ${res.}");
        // print(json.decode(res.body)['status_code']);
        // print(json.decode(res.body)['access_token']);

        // print("Response status: ${res.body}['status_code']");
        // print("Response status: ${res.body}");
        // print("Response status: ${res.body}");

        if (json.decode(res.body)['status_code'] == 500) {
          // if (jsonResponse != null) {
          //   setState(() {
          //     _isLoading = false;
          //   });
          //   sharedPreferences.setString("token", jsonResponse["token"]);
          //   Navigator.of(context).pushAndRemoveUntil(
          //       MaterialPageRoute(builder: (BuildContext contex) => HomeApp()),
          //       (Route<dynamic> route) => false);
          // }
          Alert(
            context: context,
            type: AlertType.error,
            title: "Error",
            desc: "Email atau Password salah",
            buttons: [
              DialogButton(
                child: Text(
                  "Kembali",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
            ],
          ).show();
        } else {
          jsonResponse = json.decode(res.body);
          if (jsonResponse != null) {
            setState(() {
              _isLoading = false;
            });
            sharedPreferences.setString("token", jsonResponse["token"]);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext contex) => HomeApp()),
                (Route<dynamic> route) => false);
          }
        }
        //====================
        // if (json.decode(res.body)['status_code'] == 500) {
        //   Alert(
        //     context: context,
        //     type: AlertType.error,
        //     title: "Error",
        //     desc: "Email atau Password salah",
        //     buttons: [
        //       DialogButton(
        //         child: Text(
        //           "Kembali",
        //           style: TextStyle(color: Colors.white, fontSize: 20),
        //         ),
        //         onPressed: () => Navigator.pop(context),
        //         color: Color.fromRGBO(0, 179, 134, 1.0),
        //       ),
        //     ],
        //   ).show();
        // }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: GoogleFonts.openSansCondensed(
                  textStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Hexcolor('#f0787d'))),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login-svg.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              controller: _emailController,
              hintText: "Masukan Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                // _emailController.text == "" || _passwordController.text == ""
                //     ? print("kosong")
                //     // ignore: unnecessary_statements
                //     : () {
                //         setState(() {
                //           _isLoading = true;
                //         });
                signIn(_emailController.text, _passwordController.text);
                // };
              },
            ),
            HaveAccountCheck(
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

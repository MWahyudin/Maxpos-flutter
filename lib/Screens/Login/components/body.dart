import 'dart:convert';
import 'package:api/Screens/Login/login_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:customprompt/customprompt.dart';
import 'package:dio/dio.dart';
import 'package:easy_dialog/easy_dialog.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:smart_progress_bar/smart_progress_bar.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ndialog/ndialog.dart';

class Body extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

const List<Key> keys = [
  Key("Network"),
  Key("NetworkDialog"),
  Key("Flare"),
  Key("FlareDialog"),
  Key("Asset"),
  Key("AssetDialog")
];

class _LoginPageState extends State<Body> {
  final storage = new FlutterSecureStorage();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FlutterEasyLoading(
      child: Scaffold(
        // key: myGlobals.scaffoldKey,
        body: Background(
          // key: _scaffold,
          // key: _formKey,
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
                      var email = _emailController.text;
                      var password = _passwordController.text;
                      //write to the secure storage
                      if (email.isEmpty || password.isEmpty) {
                        EasyDialog(
                            title: Text(
                              "Error",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textScaleFactor: 1.2,
                            ),
                            description: Text(
                              "Email & password harus di isi",
                              textScaleFactor: 1.1,
                              textAlign: TextAlign.center,
                            )).show(context);
                      } else {
                        // print(email);
                        // print(password);
                        this.attemptLogIn(email, password);
                      }
                    }),
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
        ),
      ),
    );
  }

  Future<String> attemptLogIn(String email, String password) async {
    String url = "http://apikompag.maxproitsolution.com/api/login";
    var statusCode;
    // showProgressBar(
    //   whileRun: () async {
    //     //any code
    EasyLoading.show(status: 'loading...');
    var res = await Dio().post(
      url,
      data: {'email': email, 'password': password},
    );
    // print(res);
    Map responseBody = res.data;
    // print();
    String token = responseBody['access_token'];
    //  print(responseBody['status_code']);
    // print(token);
    EasyLoading.dismiss();
    // EasyLoading.showProgress(0.3, status: 'downloading...');
    responseBody['status_code'] == 500
        ? CustomPrompt(
            animDuration: 500,
            title: 'Login Gagal',
            type: Type.error,
            curve: Curves.easeInCubic,
            transparent: true,
            context: context,
            btnOneText: Text('Login kembali'),
            content: 'Email atau Password salah!',
            btnOneOnClick: () => print('Okay click'),
          ).alert()
        : CustomPrompt(
            animDuration: 500,
            title: 'Login Success',
            type: Type.success,
            curve: Curves.bounceInOut,
            transparent: true,
            context: context,
            // btnOneText: Text('Login kembali'),
            content: 'Login berhasil!',
            btnOneOnClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(token: token,)),
              );
            }).alert();

//     });

    // if (responseBody['status_code'] == 200) return res.data;
    // return null;
    // Map responseBody = res.data;
    // print(responseBody['status_code']);
    // setState(() {
    //   statusCode = responseBody['status_code'];
    // });

    // print(json.decode(res.data));
    // print("hello");
    // jsonDecode(res);

    //     // return responseBody['status_code'];
    //   },
    // );
    // print(attemptLogIn());

    // print(attemptLogIn);
    // showProgressBar(
    //   whileRun: () async {
    //     //any code
    //     var res = await http.post(
    //       url,
    //       body: {"email": email, "password": password},
    //       headers: {'Accept': 'application/json'},
    //     );
    //     return res;
    //   },
    // );

    // if (res.statusCode == 200) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomeScreen(),
    //     ),
    //   );
    // } else {
    //   EasyDialog(
    //       title: Text(
    //         "Login Gagal",
    //         style: TextStyle(fontWeight: FontWeight.bold),
    //         textScaleFactor: 1.2,
    //       ),
    //       description: Text(
    //         "Email atau password salah, silahkan login kembali",
    //         textScaleFactor: 1.1,
    //         textAlign: TextAlign.center,
    //       )).show(context);
    // }
  }
}

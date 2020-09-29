import 'package:flutter/material.dart';


class ProfilScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Profil page",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
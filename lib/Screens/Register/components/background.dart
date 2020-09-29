import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
    // @required this.size,
    // @required this.child,
  }) : super(key: key);

  // final Size size;
  // final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/signup_top.png",
                  width: size.width * 0.35,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  width: size.width * 0.25,
                ),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}

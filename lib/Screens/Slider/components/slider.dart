import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_svg/svg.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String desciption;
  final String image;

  const SliderPage({Key key, this.title, this.desciption, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            image,
            width: width * 0.9,

          ),
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: GoogleFonts.meriendaOne(fontSize: 28, fontWeight: FontWeight.bold, color: Hexcolor('#f50c14')),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              desciption,
              style: GoogleFonts.sriracha(
                  height: 1.5,
                  fontSize: 16,
                 
                 ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}

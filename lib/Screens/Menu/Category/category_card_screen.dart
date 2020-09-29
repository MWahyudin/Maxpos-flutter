import 'package:api/constant.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.svgSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 28),
                blurRadius: 19,
                spreadRadius: -23,
                // color: kShadowColor
              )
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            // color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(
                    svgSrc,
                    height: 80,
                  ),
                  Spacer(),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

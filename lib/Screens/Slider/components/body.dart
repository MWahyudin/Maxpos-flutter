import 'package:api/Screens/Slider/components/slider.dart';
import 'package:api/Screens/Welcome/welcome_screen.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "Kemudahan",
      desciption:
          "Kemudahan dan kenyamanan dalam mengatur usaha anda gak perlu ribet , semua serba mudah",
      image: "assets/icons/kemudahan2.svg",
    ),
    SliderPage(
      title: "Perencanaan",
      desciption:
          "Sesuaikan kebutuhan usaha anda dengan perencanaan yang matang",
      image: "assets/icons/perencanaan2.svg",
    ),
    SliderPage(
      title: "Laporan",
      desciption:
          "Melalui aplikasi ,laporan harian,bulanan & tahunan disuguhkan dengan tepat,cepat & akurat",
      image: "assets/icons/laporan2.svg",
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _pages.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: Duration(microseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? kPrimaryColor
                              : kPrimaryLightColor),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(microseconds: 800),
                      curve: Curves.easeInOut);
                },
                child: AnimatedContainer(
                  duration: Duration(microseconds: 300),
                  height: 70,
                  alignment: Alignment.center,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 70,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return WelcomeScreen();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Mari bergabung",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))
                      : Icon(
                          Icons.navigate_next,
                          color: Colors.white,
                          size: 50,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

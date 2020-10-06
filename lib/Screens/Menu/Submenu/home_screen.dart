import 'package:api/Screens/Login/login_screen.dart';
import 'package:api/Screens/Menu/Category/category_card_screen.dart';
import 'package:api/Screens/Menu/Submenu/barang_screen.dart';
import 'package:api/Screens/Menu/body.dart';
import 'package:api/components/bottom_bar.dart';
import 'package:api/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  final String token;

  const HomeScreen({Key key, this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaxPos APP',
      theme: ThemeData(
        fontFamily: 'meriendaOne',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeApp(
        token: token,
      ),
    );
  }
}

class HomeApp extends StatelessWidget {
  final String token;

  const HomeApp({Key key, this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage(
                  "assets/images/undraw_pilates.png",
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/menu.svg",
                          // height: size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Selamat datang \nUser",
                    style: GoogleFonts.meriendaOne(
                        textStyle: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontWeight: FontWeight.w900),
                        fontSize: 30),
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 30),
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  //   decoration: BoxDecoration(
                  //     // border: BoxBorder(bo)
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(29.5),
                  //   ),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       icon: SvgPicture.asset("assets/icons/search.svg"),
                  //       hintText: "Pencarian...",
                  //     ),
                  //   ),
                  // ),
                  Container(
                    height: size.height * 0.60,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: .85,
                      children: <Widget>[
                        CategoryCard(
                          svgSrc: "assets/icons/money.svg",
                          title: "Daftar Penjualan",
                          press: () {
                            // final storage = new FlutterSecureStorage();
                            // String token = await storage.read(key: token);
                            // print(token);
                            print("daftar penjualan");
                          },
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/check.svg",
                          title: "Daftar Pembelian",
                          press: () {
                            print("daftar pembelian");
                          },
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/market.svg",
                          title: "Daftar Suplier",
                          press: () {},
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/tshirt.svg",
                          title: "Daftar Barang",
                          press: () {
                            print('token: $token');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BarangScreen(token: token,)),
                            );
                          },
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/price-tag.svg",
                          title: "Daftar Kategori",
                          press: () {},
                        ),
                        CategoryCard(
                          svgSrc: "assets/icons/web_store.svg",
                          title: "Daftar Satuan",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   child: HomePage(),
                  // )
                ],
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: AppBottomBar(),
    );
  }
}

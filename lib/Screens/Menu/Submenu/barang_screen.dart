import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Barang {
  final image;
  final name;
  final harga;

  Barang(this.image, this.name, this.harga);
}

class BarangScreen extends StatefulWidget {
  final String token;

  const BarangScreen({Key key, this.token}) : super(key: key);
  @override
  _BarangScreenState createState() => _BarangScreenState();
}

class _BarangScreenState extends State<BarangScreen> {

   @override
  void initState() {
    _getToken().then((value) {
      // print(token);
      print(value);
      // widget.token;
    });
    super.initState();
  }

  Future _getToken() async {
    await Future.delayed(Duration(seconds: 1));
    String value = widget.token;
    // String value = await storage.read(key: token);

    return value;
  }
  int selectedpage = 0;
  List barangs = [
    Barang(
      'https://id.360buyimg.com/Indonesia/s880x0_/nHBfsgABDAAAABoABEhSVgAEqcw.png.webp',
      'Kertas hvs',
      10000,
    ),
    Barang(
      'https://www.sunlight.co.id/sk-eu/content/dam/brands/sunlight/indonesia/1937942-8999999390198-f.png.rendition.767.767.png',
      'Sabun cuci',
      15000,
    ),
    Barang(
      'https://www.sunlight.co.id/sk-eu/content/dam/brands/sunlight/indonesia/1937942-8999999390198-f.png.rendition.767.767.png',
      'Sabun cuci',
      15000,
    ),
    Barang(
      'https://www.sunlight.co.id/sk-eu/content/dam/brands/sunlight/indonesia/1937942-8999999390198-f.png.rendition.767.767.png',
      'Sabun cuci',
      15000,
    ),
    Barang(
      'https://www.sunlight.co.id/sk-eu/content/dam/brands/sunlight/indonesia/1937942-8999999390198-f.png.rendition.767.767.png',
      'Sabun cuci',
      15000,
    ),
    Barang(
      'https://www.sunlight.co.id/sk-eu/content/dam/brands/sunlight/indonesia/1937942-8999999390198-f.png.rendition.767.767.png',
      'Sabun cuci',
      15000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff6f7f9),
        appBar: AppBar(
          backgroundColor: Colors.red[300],
          centerTitle: true,
          title: Text("Daftar Barang"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              height: 50,
              color: Colors.transparent,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  'Feature item',
                  'Barang baru',
                  'Barang terakhir',
                  'Barang habis',
                  'Elektronik',
                  'Sembako',
                  'Pakaian'
                ]
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: OutlineButton(
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(e)),
                      ),
                    )
                    .toList(),
              ),
            ),
            Column(
              children: barangs
                  .map((e) => Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[200],
                                blurRadius: 10,
                                spreadRadius: 3,
                                offset: Offset(3, 4)),
                          ],
                        ),
                        height: 100,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: ListTile(
                          leading: Image.network(
                            e.image,
                            fit: BoxFit.fill,
                            height: 80,
                            width: 110,
                            // height: 120,
                          ),
                          title: Text(
                            e.name,
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(e.harga.toString()),
                              Container(
                                height: 40,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 180,
                                      bottom: 0,
                                      child: ClipOval(
                                        child: Image.network(
                                          "https://icon-library.com/images/add-image-icon-png/add-image-icon-png-1.jpg",
                                          fit: BoxFit.cover,
                                          width: 40.0,
                                          height: 40.0,
                                        ),
                                      ),
                                      //  child: CircleAvatar(
                                      //    backgroundImage: ExactAssetImage('assets/images/undraw_pilates.png'),
                                      //    backgroundColor: Colors.red,
                                      //   //  backgroundImage: AssetImage('assets/images/undraw_pilates.png'),
                                      //  ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}

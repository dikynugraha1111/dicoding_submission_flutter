// @dart=2.9
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;
  List img = [
    "https://cdn.auth0.com/blog/illustrations/flutter.png",
    "https://cdn.auth0.com/blog/illustrations/flutter.png",
    "https://cdn.auth0.com/blog/illustrations/flutter.png"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: new Column(
      children: [
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new CarouselSlider(
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                autoPlayAnimationDuration: Duration(milliseconds: 1800),
                pauseAutoPlayOnTouch: Duration(seconds: 4),
                height: 200.0,
                initialPage: 0,
                onPageChanged: (index) {
                  setState(() {
                    current = index;
                  });
                },
                items: img.map((imgUrl) {
                  return LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      width: 411,
                      decoration: BoxDecoration(
                        color: HexColor("#264653"),
                      ),
                      child: Image.network(
                        imgUrl,
                        width: 411,
                        fit: BoxFit.cover,
                      ),
                    );
                  });
                }).toList()),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(img, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          current == index ? HexColor("#264653") : Colors.grey),
                );
              }),
            )
          ],
        ),
        new Text(MediaQuery.of(context).size.width.toString()),
      ],
    )));
  }
}

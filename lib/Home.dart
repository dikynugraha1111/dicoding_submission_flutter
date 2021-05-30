// @dart=2.9
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';

import 'model/GetData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current = 0;
  List img = [
    "https://foto.kontan.co.id/ZtqnsCKMUotw3laCVwL7crhni54=/smart/2021/01/04/112846091p.jpg",
    "https://ichef.bbci.co.uk/news/640/cpsprodpb/100AA/production/_100860756_gettyimages-635793190.jpg",
    "https://www.nestle.co.id/sites/g/files/pydnoa241/files/asset-library/publishingimages/produk/kembanggulacoklat/nescafe-feed.jpg"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget carousel() {
    return new CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 6),
          autoPlayAnimationDuration: Duration(milliseconds: 1800),
          pauseAutoPlayOnTouch: true,
          height: 200.0,
          initialPage: 0,
          onPageChanged: (index, c) {
            setState(() {
              current = index;
            });
          },
        ),
        items: img.map((imgUrl) {
          return Builder(builder: (BuildContext context) {
            return Container(
                margin: EdgeInsets.only(right: 7.0, left: 7.0, top: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor("#264653"),
                ),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ));
          });
        }).toList());
  }

  GetDataItem getDataItem;
  List itemModel;
  Future<List<dynamic>> _dataModel() async {
    GetDataItem.connectToApi().then((value) {
      itemModel = value.data;
    });
    return itemModel;
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
            carousel(),
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
        new SizedBox(
          height: 25.0,
        ),
        new Container(
          height: MediaQuery.of(context).size.height,
          child: new FutureBuilder(
              future: _dataModel(),
              builder: (context, webService) {
                if (webService.hasError) {
                  print(webService.error);
                }
                return webService.hasData
                    ? new ItemListData(
                        listData: webService.data,
                      )
                    : Column(children: [
                        new Padding(
                            padding: EdgeInsets.only(top: 75.0),
                            child: new CircularProgressIndicator())
                      ]);
              }),
        )
      ],
    )));
  }
}

class ItemListData extends StatefulWidget {
  final List listData;
  ItemListData({this.listData});
  @override
  _ItemListDataState createState() => _ItemListDataState();
}

class _ItemListDataState extends State<ItemListData> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.listData == null ? 0 : widget.listData.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: EdgeInsets.all(5.0),
          child: new GestureDetector(
            onTap: () {},
            child: new Card(
                elevation: 7.0,
                clipBehavior: Clip.antiAlias,
                child: new Row(
                  children: [
                    new Padding(
                      padding: EdgeInsets.all(5.0),
                      child: new Material(
                        child: new ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: new Image.network(
                              widget.listData[i]["picture"],
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace stackTrace) {
                                print(exception);
                                return Text('😢');
                              },
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    new Expanded(
                      child: new Padding(
                        padding: EdgeInsets.all(5.0),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              new Text(widget.listData[i]["firstName"],
                                  style: new TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      color: Colors.black)),
                              new Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: new Row(children: [
                                  new Expanded(
                                      child:
                                          new Text(widget.listData[i]["email"],
                                              style: new TextStyle(
                                                fontWeight: FontWeight.w300,
                                              )))
                                ]),
                              )
                            ]),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}

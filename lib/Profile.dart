import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        new Stack(children: [
          new Container(
              decoration: new BoxDecoration(
                  color: HexColor("#2a9d8f"),
                  borderRadius: new BorderRadius.only(
                      bottomLeft: Radius.circular(21.0),
                      bottomRight: Radius.circular(21.0))),
              width: double.infinity,
              height: 150.0,
              child: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: new Text(
                  "Diky Nugraha Difiera",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 75.0),
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white,
                      width: 7.0,
                      style: BorderStyle.solid),
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://foto.kontan.co.id/ZtqnsCKMUotw3laCVwL7crhni54=/smart/2021/01/04/112846091p.jpg"))),
            ),
          ),
        ]),
        SizedBox(
          height: 15.0,
        ),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor("#2a9d8f"),
            ),
            onPressed: () {},
            child: new Text("GitHub.. !!!")),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor("#2a9d8f"),
            ),
            onPressed: () {},
            child: new Text("Get API.. !!!")),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor("#2a9d8f"),
            ),
            onPressed: () {},
            child: new Text("LinkedIn.. !!!")),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor("#2a9d8f"),
            ),
            onPressed: () {},
            child: new Text("Instagram.. !!!")),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

const _urlGit = 'https://github.com/dikynugraha1111';
const _urlAPI = 'https://mocki.io/v1/b419c87c-668b-47c1-b070-3be1868bb285';
const _urlLink = 'https://www.linkedin.com/in/diky-nugraha-difiera/';
const _urlInst = 'https://www.instagram.com/dikydifiera/';

void _launchURLGit() async => await canLaunch(_urlGit)
    ? await launch(_urlGit)
    : throw 'Could not launch $_urlGit';

void _launchURLAPI() async => await canLaunch(_urlAPI)
    ? await launch(_urlAPI)
    : throw 'Could not launch $_urlAPI';

void _launchURLLink() async => await canLaunch(_urlLink)
    ? await launch(_urlLink)
    : throw 'Could not launch $_urlLink';

void _launchURLIns() async => await canLaunch(_urlInst)
    ? await launch(_urlInst)
    : throw 'Could not launch $_urlInst';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
            onPressed: () {
              _launchURLGit();
            },
            child: new Text("GitHub.. !!!")),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor("#2a9d8f"),
            ),
            onPressed: () {
              _launchURLAPI();
            },
            child: new Text("Get API.. !!!")),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor("#2a9d8f"),
            ),
            onPressed: () {
              _launchURLLink();
            },
            child: new Text("LinkedIn.. !!!")),
        new ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: HexColor("#2a9d8f"),
            ),
            onPressed: () {
              _launchURLIns();
            },
            child: new Text("Instagram.. !!!")),
      ]),
    );
  }
}

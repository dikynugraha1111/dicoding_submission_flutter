// @dart=2.9
import 'package:dicoding_submission/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:introduction_screen/introduction_screen.dart';

void shared() async {
  SharedPreferences prefs2 = await SharedPreferences.getInstance();
  await prefs2.setInt("initScreen", 1);
}

class OnBoardingPage extends StatelessWidget {
  Widget buildImage(String path) {
    return Padding(
      padding: EdgeInsets.only(top: 125.0, left: 20.0, right: 20.0),
      child: Center(
        child: SvgPicture.asset(
          path,
          width: 350.0,
        ),
      ),
    );
  }

  PageDecoration getPageDecor() {
    return PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: HexColor("#2a9d8f"),
          letterSpacing: 2.0,
          fontFamily: 'Poppins',
        ),
        bodyTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.black87,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.italic),
        titlePadding: EdgeInsets.only(right: 15.0, left: 15.0, top: 25.0),
        descriptionPadding: EdgeInsets.only(right: 15.0, left: 15.0, top: 25.0),
        imagePadding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
        pageColor: Colors.white);
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: "UAD",
          body: "Dengan mengetahui Batik, kamu telah melestarikan Budaya...>>>",
          image: buildImage("img/op1.svg"),
          decoration: getPageDecor()),
      PageViewModel(
        title: "UAD",
        body: "Dengan mengetahui Batik, kamu telah melestarikan Budaya...>>>",
        image: buildImage("img/op1.svg"),
        decoration: getPageDecor(),
      ),
      PageViewModel(
        title: "UAD",
        body: "Dengan mengetahui Batik, kamu telah melestarikan Budaya...>>>",
        image: buildImage("img/op1.svg"),
        decoration: getPageDecor(),
        footer: RaisedButton(
          onPressed: () {},
          color: HexColor("#2a9d8f"),
          shape: StadiumBorder(),
          child: Text(
            "Done",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new IntroductionScreen(
        pages: getPages(),
        onDone: () {},
        done: ElevatedButton(
          onPressed: () {
            shared();
            Navigator.of(context).pushReplacement(
                new MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }));
          },
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), primary: HexColor("#2a9d8f")),
          child: Text(
            "Login",
            style: new TextStyle(color: Colors.white),
          ),
        ),
        showSkipButton: true,
        skip: Text("Skip",
            style: new TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              letterSpacing: 5,
            )),
        showNextButton: true,
        next: Icon(Icons.arrow_forward, color: Colors.white),
        dotsDecorator: DotsDecorator(
            color: Colors.grey[400],
            activeColor: HexColor("#2a9d8f"),
            activeSize: Size(25.0, 10.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}

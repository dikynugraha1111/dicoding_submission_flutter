// @dart=2.9
import 'package:dicoding_submission/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:introduction_screen/introduction_screen.dart';

void shared() async {
  SharedPreferences prefs2 = await SharedPreferences.getInstance();
  await prefs2.setInt("initScreen", 1);
}

class OnBoardingPage extends StatelessWidget {
  Widget buildImage(String path) {
    return Padding(
      padding: EdgeInsets.only(top: 100.0),
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
          color: Colors.blueAccent,
          letterSpacing: 2.0,
          fontFamily: 'Poppins',
        ),
        bodyTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.italic),
        descriptionPadding: EdgeInsets.only(right: 15.0, left: 15.0, top: 5.0),
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
          color: Colors.blue,
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
              textStyle: TextStyle(color: Colors.white),
              shape: StadiumBorder(),
              onPrimary: Colors.red),
          child: Text(
            "Login",
          ),
        ),
        showSkipButton: true,
        skip: Text("Skip",
            style: new TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w600,
              letterSpacing: 5,
            )),
        showNextButton: true,
        next: Icon(Icons.arrow_forward, color: Colors.white),
        dotsDecorator: DotsDecorator(
            color: Colors.grey[400],
            activeColor: Colors.blueAccent,
            activeSize: Size(25.0, 10.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}

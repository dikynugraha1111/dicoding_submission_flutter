// @dart=2.9
import 'package:dicoding_submission/onBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';

int initScreen = 0;
String usernamemain = "";
String token = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  print("initScreen $initScreen");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KopNus',
        debugShowCheckedModeBanner: false,
        home: initScreen == 1 || initScreen == null
            ? OnBoardingPage()
            : HomePage());
  }
}

// @dart=2.9
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dicoding_submission/Profile.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  final Home homeTab = Home();
  final Profile profileTab = Profile();

  Widget _viewPage = new Home();

  Widget _selectPage(int page) {
    switch (page) {
      case 0:
        return homeTab;
        break;
      case 1:
        return profileTab;
        break;
      default:
        return homeTab;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: _pageIndex,
          onTap: (int page) {
            setState(() {
              _viewPage = _selectPage(page);
            });
          },
          color: HexColor("#264653"),
          backgroundColor: Colors.white,
          buttonBackgroundColor: HexColor("#2a9d8f"),
          height: 55,
          animationDuration: Duration(milliseconds: 250),
          animationCurve: Curves.bounceInOut,
          items: [
            Icon(Icons.home, size: 20, color: Colors.white),
            Icon(Icons.person, size: 20, color: Colors.white),
          ],
        ),
        body: _viewPage);
  }
}

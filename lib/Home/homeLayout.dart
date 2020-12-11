import 'package:covid/Home/homeScreen.dart';
import 'package:covid/Home/homeScreenDrawer.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static String id = 'Home';
  final data;
  HomeLayout(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[HomeScreenDrawer(), Home(data: data)],
        ),
      ),
    );
  }
}

//ca-app-pub-8071094596626445~4870267931

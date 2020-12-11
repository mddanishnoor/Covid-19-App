import 'dart:async';
import 'package:covid/Home/homeLayout.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    setState(() {
      Timer(Duration(seconds: 2),
          () => Navigator.popAndPushNamed(context, HomeLayout.id));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF062D34), child: LoadingBouncingGrid.square());
  }
}

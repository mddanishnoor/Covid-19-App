import 'package:covid/precautions/precautions.dart';
import 'package:flutter/material.dart';
import 'package:covid/drawerMenu.dart';

class PrecautionLayout extends StatelessWidget {
  static String id = "Precautions";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[DrawerScreen(), Precautions()],
        ),
      ),
    );
  }
}

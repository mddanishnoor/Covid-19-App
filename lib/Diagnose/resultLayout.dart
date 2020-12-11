import 'package:covid/Diagnose/diagnoseResult.dart';
import 'package:flutter/material.dart';
import '../drawerMenu.dart';

class ResultLayout extends StatelessWidget {
  static String id = 'Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[DrawerScreen(), DiagnoseResult()],
        ),
      ),
    );
  }
}

import 'package:covid/Diagnose/diagnose.dart';
import 'package:flutter/material.dart';
import '../drawerMenu.dart';

class DiagnoseLayout extends StatelessWidget {
  static String id = 'Diagnose';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[DrawerScreen(), Diagnose()],
        ),
      ),
    );
  }
}

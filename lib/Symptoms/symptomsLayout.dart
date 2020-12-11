import 'package:covid/Symptoms/symptoms.dart';
import 'package:flutter/material.dart';
import '../drawerMenu.dart';

class SymptomsLayout extends StatelessWidget {
  static String id = 'Symptoms';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[DrawerScreen(), Symptoms()],
        ),
      ),
    );
  }
}

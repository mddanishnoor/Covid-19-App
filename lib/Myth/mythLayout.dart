
import 'package:covid/Myth/factsvmyths.dart';
import 'package:flutter/material.dart';
import '../drawerMenu.dart';

class MythLayout extends StatelessWidget {
  static String id = 'FactsVMyth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[DrawerScreen(), FactsVMyths()],
        ),
      ),
    );
  }
}

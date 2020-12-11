import 'package:covid/Q&A/q&a.dart';
import 'package:flutter/material.dart';
import 'package:covid/drawerMenu.dart';

class QuestionsLayout extends StatelessWidget {
  static String id = "Questions";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[DrawerScreen(), Questions()],
        ),
      ),
    );
  }
}

import 'package:covid/drawerMenu.dart';
import 'package:flutter/material.dart';
import 'liveUpdate.dart';

class StatsLayout extends StatelessWidget {
  final data;
  final dataLength;
  static String id = 'StatsLayout';
  StatsLayout({this.data, this.dataLength});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            DrawerScreen(),
            LiveUpdates(
              data: data,
              dataLength: dataLength,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:covid/Diagnose/diagnoseLayout.dart';
import 'package:covid/Myth/mythLayout.dart';
import 'package:covid/Q&A/qnaLayout.dart';
import 'package:covid/Stats/statsLayout.dart';
import 'package:covid/Symptoms/symptomsLayout.dart';
import 'package:covid/precautions/precautionLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  final data;
  Home({this.data});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;
  double xOffset = 0;

  double yOffset = 0;

  double scaleFactor = 1;

  double borderRadius = 0;

  bool drawerActive = false;
  @override
  void initState() {
    data = widget.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius))),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                List: [Color(0xFF062D34), Color(0xFF25737B)])),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.width / 6,
                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                decoration: BoxDecoration(
                    color: Color(0xFF26757D).withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(borderRadius))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/logo.png',
                        color: Colors.white,
                        height: 45,
                      ),
                    ),
                    Text(
                      'COVID-19',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    FittedBox(
                      child: Column(
                        children: <Widget>[
                          drawerActive
                              ? IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: 32,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      xOffset = 0;
                                      yOffset = 0;
                                      scaleFactor = 1;
                                      borderRadius = 0;
                                      drawerActive = false;
                                    });
                                  },
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    size: 32,
                                  ),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      xOffset = -50;
                                      yOffset =
                                          MediaQuery.of(context).size.height /
                                              5;
                                      borderRadius = 30;
                                      scaleFactor = 0.6;
                                      drawerActive = true;
                                    });
                                  },
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: -110,
              top: 70,
              child: Image.asset(
                'assets/virus_bg.png',
                color: Color(0xFFEE6161),
                height: MediaQuery.of(context).size.height / 1.8,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2.5,
              child: Container(
                padding:
                    EdgeInsets.only(right: 15, left: 15, bottom: 100, top: 5),
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: FittedBox(
                  child: Column(
                    children: <Widget>[
                      FittedBox(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xFFF3F4F5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Stay Home \nStay Safe',
                                    style: TextStyle(
                                        fontSize: 35, color: Color(0xFF25737B)),
                                  ),
                                ),
                                Image.asset(
                                  'assets/stayhome.png',
                                  height:
                                      MediaQuery.of(context).size.width / 3.5,
                                  width:
                                      MediaQuery.of(context).size.width / 3.5,
                                  color: Color(0xFF26757D),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, StatsLayout.id);
                                    });
                                  },
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 15,
                                          right: 0,
                                          left: 0,
                                          bottom: 5),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image.asset(
                                        'assets/stats.png',
                                        color: Color(0xFF26757D),
                                      )),
                                ),
                                Text('Statistics'),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, MythLayout.id);
                                    });
                                  },
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 15,
                                          right: 0,
                                          left: 0,
                                          bottom: 5),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image.asset(
                                        'assets/myth.png',
                                        color: Color(0xFF26757D),
                                      )),
                                ),
                                Text('Myth Buster'),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, DiagnoseLayout.id);
                                    });
                                  },
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 15,
                                          right: 0,
                                          left: 0,
                                          bottom: 5),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image.asset(
                                        'assets/diagnose.png',
                                        color: Color(0xFF26757D),
                                      )),
                                ),
                                Text('Self Diagnose'),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, PrecautionLayout.id);
                                    });
                                  },
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 15,
                                          right: 0,
                                          left: 0,
                                          bottom: 5),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image.asset(
                                        'assets/precaution.png',
                                        color: Color(0xFF26757D),
                                      )),
                                ),
                                Text('Precautions'),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, SymptomsLayout.id);
                                    });
                                  },
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 15,
                                          right: 0,
                                          left: 0,
                                          bottom: 5),
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image.asset(
                                        'assets/cough.jpg',
                                        color: Color(0xFF26757D),
                                      )),
                                ),
                                Text('Symptoms'),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Navigator.pushNamed(
                                          context, QuestionsLayout.id);
                                    });
                                  },
                                  child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      margin: EdgeInsets.only(
                                          top: 15,
                                          right: 0,
                                          left: 0,
                                          bottom: 5),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF3F4F5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Image.asset(
                                        'assets/Q&A.png',
                                        color: Color(0xFF26757D),
                                      )),
                                ),
                                Text('Q & A'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

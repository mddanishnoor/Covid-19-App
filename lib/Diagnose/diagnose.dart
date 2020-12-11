import 'package:covid/Diagnose/resultLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diagnose extends StatefulWidget {
  @override
  _DiagnoseState createState() => _DiagnoseState();
}

int result = 0;
int temp = 0;

class _DiagnoseState extends State<Diagnose> {
  double xOffset = 0;

  double yOffset = 0;

  double scaleFactor = 1;

  double borderRadius = 0;

  bool drawerActive = false;
  int index = 0;
  void updateFlag() {
    if (index == 0) {
      setState(() {
        result = 4;
        temp = result;
        Navigator.popAndPushNamed(context, ResultLayout.id);

        result = 0;
      });
    } else {
      setState(() {
        result++;
        updateQuestion();
      });
    }
  }

  void updateQuestion() {
    if ((index + 1) > 4) {
      setState(() {
        temp = result;

        Navigator.popAndPushNamed(context, ResultLayout.id);
        result = 0;
      });
    } else {
      index++;
    }
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
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width / 6,
            padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
            decoration: BoxDecoration(
                color: Color(0xFF26757D),
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(borderRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/logo.png',
                      color: Colors.white,
                      height: 45,
                    ),
                  ),
                ),
                Text(
                  'Myth Buster',
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
                                      MediaQuery.of(context).size.height / 5;
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
          Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Card(
                margin: EdgeInsets.only(left: 30, right: 30),
                elevation: 5,
                color: Color(0xFF26757D),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: MediaQuery.of(context).size.height / 1.7,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SingleChildScrollView(
                      child: Text(diagnoseQuestion[index],
                          style: TextStyle(color: Colors.white, fontSize: 22)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        updateFlag();
                      });
                    },
                    child: Card(
                      color: Color(0xFF26757D),
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Center(
                            child: Text(
                          'Yes',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4.2,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        updateQuestion();
                      });
                    },
                    child: Card(
                      color: Color(0xFF26757D),
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Center(
                            child: Text('No',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

List<String> diagnoseQuestion = [
  'Do you have any of these\nlife-threatening symptoms?\n '
      ' \n >Bluish lips or face\n\n >Severe and constant pain or pressure in the chest\n\n >Extreme difficulty breathing (such as gasping for air or being unable to talk without catching your breath)\n\n >Severe and constant dizziness or lightheadedness\n\n >Serious disorientation (acting confused)\n >Unconscious or very difficult to wake up\n\n >Slurred speech or difficulty speaking (new or worsening) Seizures\n\n >Signs of low blood pressure (too weak to stand, light headed, feeling cold, pale, clammy skin)',
  'Do you fall in the age bracket of [0-17,65+]?',
  'Are you feeling sick',
  'In the two weeks before you felt sick, did you have contact with someone diagnosed with COVID‑19?',
  'Do you have any of the following?\n\n >Fever or feeling feverish (chills, sweating)\n >Cough\n >Mild or moderate difficulty breathing\n >Sore throat\n >Muscle aches or body aches\n >Vomiting or diarrhea\n >New loss of taste or smell',
];

import 'package:covid/Diagnose/diagnoseLayout.dart';
import 'package:covid/Myth/mythLayout.dart';
import 'package:covid/Q&A/qnaLayout.dart';
import 'package:covid/Stats/statsLayout.dart';
import 'package:covid/Symptoms/symptomsLayout.dart';
import 'package:covid/feedback.dart';
import 'package:covid/precautions/precautionLayout.dart';
import 'package:flutter/material.dart';

class HomeScreenDrawer extends StatefulWidget {
  @override
  _HomeScreenDrawerState createState() => _HomeScreenDrawerState();
}

class _HomeScreenDrawerState extends State<HomeScreenDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            List: [
              Color(0xFF062D34),
              Color(0xFF25737B),
            ]),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, StatsLayout.id);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Live Updates',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MythLayout.id);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Facts vs Myth',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, DiagnoseLayout.id);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Self Diagnosis',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, PrecautionLayout.id);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Precautions',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, SymptomsLayout.id);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Symptoms',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.popAndPushNamed(context, QuestionsLayout.id);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Q and A',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: feedbackCard(context),
                          );
                        });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Feedback',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              )
            ],
          ),
          SizedBox(
            height: double.infinity,
            width: 20,
          ),
        ],
      ),
    );
  }
}

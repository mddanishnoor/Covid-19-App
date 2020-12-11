import 'package:covid/Diagnose/diagnoseLayout.dart';
import 'package:covid/Myth/mythLayout.dart';
import 'package:covid/Q&A/qnaLayout.dart';
import 'package:covid/Stats/statsLayout.dart';
import 'package:covid/Symptoms/symptomsLayout.dart';
import 'package:covid/feedback.dart';
import 'package:covid/precautions/precautionLayout.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  void bugFeedback(String feed) {
    Navigator.pop(context);
    showModalBottomSheet(
        context: context,
        builder: (context) {
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
            child: Center(
              child: Text(
                'Thank you\nfor your\nFeedback',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        });
  }

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
                    Navigator.popAndPushNamed(context, StatsLayout.id);
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
                    Navigator.popAndPushNamed(context, MythLayout.id);
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
                    Navigator.popAndPushNamed(context, DiagnoseLayout.id);
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
                  Navigator.popAndPushNamed(context, PrecautionLayout.id);
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
                    Navigator.popAndPushNamed(context, SymptomsLayout.id);
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

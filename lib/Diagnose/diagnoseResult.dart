import 'package:covid/Diagnose/diagnose.dart';
import 'package:flutter/material.dart';

class DiagnoseResult extends StatefulWidget {
  @override
  _DiagnoseResultState createState() => _DiagnoseResultState();
}

class _DiagnoseResultState extends State<DiagnoseResult> {
  double xOffset = 0;

  double yOffset = 0;

  double scaleFactor = 1;

  double borderRadius = 0;

  bool drawerActive = false;

  Widget getResult() {
    if (temp > 3) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/error.png',
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width / 9,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Urgent medical attention may be needed.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            Text(
              '\nPlease call 1075 or go to the Emergency Department',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
            Text(
                '\nBased on your symptoms, you may need urgent medical care. Please call 1075 or go to the nearest emergency department. Tell the 1075 operator or emergency staff if you have had contact with someone with COVID‑19.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white))
          ],
        ),
      );
    } else if (temp > 1 && temp <= 3) {
      return Container(
        child: Column(
          children: <Widget>[
            Text(
              'Stay home and take care of yourself. Call your provider if you get worse',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
            Text(
              '\nSorry you’re not feeling well. Your symptoms may be related to COVID‑19.\n',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  '> Stay home except to get medical care.\n\n> Do not go to work, school, or public areas.\n\n> Do not use public transportation or ride sharing.\n\n> If you think it is an emergency or you feel worse, seek medical care.\n\n> Take steps to help protect others from getting sick.',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Colors.white)),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sounds like you are feeling ok\n\n',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
            Text(
              '> Monitor for symptoms.',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                top: 8,
              ),
              child: Text(
                'Watch for COVID‑19 symptoms. If you develop symptoms, call your healthcare provider, clinician advice line, or telemedicine provider.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
            Text(
              '\n> No COVID‑19 testing needed at this time.',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8, bottom: 8),
              child: Text(
                'Based on the answers you’ve given, you do not need to get tested for COVID‑19 at this time.',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      );
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
                  'Result',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                FittedBox(
                  child: drawerActive
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
                              yOffset = MediaQuery.of(context).size.height / 5;
                              borderRadius = 30;
                              scaleFactor = 0.6;
                              drawerActive = true;
                            });
                          },
                        ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 3,
          ),
          Card(
              color: Color(0xFF26757D),
              child: Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width / 1.15,
                  child: getResult()))
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  double borderRadius = 0;
  bool drawerActive = false;
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
                  'Symptoms',
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
          SizedBox(
            height: MediaQuery.of(context).size.width / 7,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                SymptomCard(
                  title: 'Cough',
                  image: 'assets/cough.jpg',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                SymptomCard(
                  title: 'Fever',
                  image: 'assets/fever.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                SymptomCard(
                  title: 'Chills',
                  image: 'assets/chills.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                SymptomCard(
                  title: 'Muscle Pain',
                  image: 'assets/musclePain.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                SymptomCard(
                  title: 'Shortness of Breath / Difficulty Breathing',
                  image: 'assets/breathshortness.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                SymptomCard(
                  title: 'Sore Throat',
                  image: 'assets/soreThroat.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  SymptomCard({
    this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2.2,
                  color: Color(0xFF25737B),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      color: Color(0xFF2d919c),
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          image,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Precautions extends StatefulWidget {
  @override
  _PrecautionsState createState() => _PrecautionsState();
}

class _PrecautionsState extends State<Precautions> {
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
                  'Precautions',
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
                PrecautionCard(
                  title: 'Stay Inside',
                  image: 'assets/stayhome.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                PrecautionCard(
                  title: 'Wash your hands frequently with soap',
                  image: 'assets/precaution.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                PrecautionCard(
                  title: 'Cover your mouth while Coughing',
                  image: 'assets/cough.jpg',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                PrecautionCard(
                  title: 'Avoid touching your Face.',
                  image: 'assets/avoidFace.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                PrecautionCard(
                  title: 'Clean and Disinfect surfaces regularly',
                  image: 'assets/disinfect.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                PrecautionCard(
                  title: 'Practice Social Distancing',
                  image: 'assets/socialDistancing.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                PrecautionCard(
                  title: 'Wear a mask',
                  image: 'assets/mask.png',
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                PrecautionCard(
                  title: 'Eat Healthy',
                  image: 'assets/eatHealthy.png',
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

class PrecautionCard extends StatelessWidget {
  final String image;
  final String title;
  PrecautionCard({
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
                            fontWeight: FontWeight.w400),
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

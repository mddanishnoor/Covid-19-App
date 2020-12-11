import 'package:covid/Home/homeLayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid/Stats/stateTile.dart';

class LiveUpdates extends StatefulWidget {
  final dataLength;

  final List<StateData> data;
  LiveUpdates({this.dataLength, this.data});

  @override
  _LiveUpdatesState createState() => _LiveUpdatesState();
}

class _LiveUpdatesState extends State<LiveUpdates> {
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
                      Navigator.popAndPushNamed(context, HomeLayout.id);
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
                  'Statistics',
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.dataLength - 1,
              itemBuilder: (_, index) =>
                  StateTile(stateData: widget.data, stateCode: index),
            ),
          ),
        ],
      ),
    );
  }
}

//
//Container(
//margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
//child: TextField(
//cursorColor: Color(0xFF26757D),
//decoration: InputDecoration(
//border: OutlineInputBorder(
//borderRadius: BorderRadius.circular(15)),
//suffixIcon: Icon(Icons.search),
//hintText: 'Search State'),
//),
//),

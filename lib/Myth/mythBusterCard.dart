import 'package:flutter/material.dart';

class MythBusterCard extends StatefulWidget {
  final String fact;
  final String myth;
  MythBusterCard({this.fact, this.myth});
  @override
  _MythBusterCardState createState() => _MythBusterCardState();
}

class _MythBusterCardState extends State<MythBusterCard> {
  Color cardRevealColor = Color(0xFF2d919c);
  String fact = 'Tap to reveal Fact';
  void cardReveal() {
    cardRevealColor = Colors.white;
    fact = widget.fact;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        color: Color(0xFF25737B),
        elevation: 10,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3.6,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: FittedBox(
                      child: Text(
                        'MYTH',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.myth,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  cardReveal();
                });
              },
              child: Container(
                color: Color(0xFF2d919c),
                height: MediaQuery.of(context).size.height / 3.6,
                width: MediaQuery.of(context).size.width / 1.3,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 60,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'FACT',
                          style: TextStyle(
                              color: cardRevealColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        )),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            fact,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

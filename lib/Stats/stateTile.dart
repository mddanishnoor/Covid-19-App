import 'package:flutter/material.dart';

class StateTile extends StatelessWidget {
  const StateTile({Key key, @required this.stateData, @required this.stateCode})
      : super(key: key);
  final List<StateData> stateData;
  final stateCode;
  static bool isExpanded;
  static Element chart;
  static int index;

  bool expandedValue() {
    isExpanded = stateData[stateCode].state == 'Total'
        ? isExpanded = true
        : isExpanded = false;
    return isExpanded;
  }

  Widget buildBottomSheet(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[Text('STATE NAME'), Text('CHART'), Text('DATA')],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    index = stateCode;
    if (stateData[stateCode].state == 'State Unassigned') {
      ++index;
      return Container(
        margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                List: [
                  Color(0xFF25737B),
                  Color(0xFF062D34).withOpacity(0.9),
                ]),
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                stateData == null ? 'NULL' : stateData[index].state,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    color: Colors.redAccent.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Confirmed\n${stateData == null ? 'NULL' : stateData[stateCode].confirmed}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Card(
                    color: Colors.lightBlueAccent.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Active\n${stateData == null ? 'NULL' : stateData[stateCode].active}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Card(
                    color: Colors.green.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recovered\n${stateData == null ? 'NULL' : stateData[stateCode].recovered}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Card(
                    color: Colors.black38,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Deaths\n${stateData == null ? 'NULL' : stateData[stateCode].deaths}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.fromLTRB(15, 8, 15, 8),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                List: [
                  Color(0xFF25737B),
                  Color(0xFF062D34).withOpacity(0.9),
                ]),
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 5),
                child: Text(
                  stateData == null ? 'NULL' : stateData[stateCode].state,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Card(
                    color: Colors.redAccent.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Confirmed\n${stateData == null ? 'NULL' : stateData[stateCode].confirmed}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Card(
                    color: Colors.lightBlueAccent.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Active\n${stateData == null ? 'NULL' : stateData[stateCode].active}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Card(
                    color: Colors.green.withOpacity(0.6),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recovered\n${stateData == null ? 'NULL' : stateData[stateCode].recovered}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Card(
                    color: Colors.black38,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Deaths\n${stateData == null ? 'NULL' : stateData[stateCode].deaths}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}

class StateData {
  final String confirmed, active, recovered, deaths, state;
  StateData(
      {this.confirmed, this.active, this.recovered, this.deaths, this.state});
}

class ChartData {
  final String numbers;
  final String label;
  final Color color;
  ChartData(this.numbers, this.label, this.color);
}

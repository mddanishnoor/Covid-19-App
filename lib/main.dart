import 'package:covid/Diagnose/diagnoseLayout.dart';

import 'package:covid/Diagnose/resultLayout.dart';
import 'package:covid/Home/homeLayout.dart';

import 'package:covid/Q&A/qnaLayout.dart';
import 'package:covid/Symptoms/symptomsLayout.dart';
import 'package:covid/loading.dart';
import 'package:covid/Myth/mythLayout.dart';
import 'package:covid/Stats/statsLayout.dart';
import 'package:covid/precautions/precautionLayout.dart';
import 'package:flutter/material.dart';

import 'Stats/stateTile.dart';
import 'data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<StateData> stateData = [];
  var data;
  var length;

  @override
  void initState() {
    covidData();
    super.initState();
  }

  void covidData() async {
    data = await Data().getData();
    if (data != null) {
      dataExtract();
    }
  }

  void dataExtract() {
    for (var d in data['statewise']) {
      final dRecovered = d['recovered'];
      final dActive = d['active'];
      final dConfirmed = d['confirmed'];
      final dDeaths = d['deaths'];
      final dState = d['state'];

      final dData = StateData(
          confirmed: dConfirmed,
          active: dActive,
          recovered: dRecovered,
          deaths: dDeaths,
          state: dState);
      stateData.add(dData);
    }
    length = stateData.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
        primaryColor: Color(0xFF062D34),
      ),
      initialRoute: HomeLayout.id,
      home: LoadingScreen(),
      routes: {
        StatsLayout.id: (context) => StatsLayout(
              data: stateData,
              dataLength: length,
            ),
        QuestionsLayout.id: (context) => QuestionsLayout(),
        DiagnoseLayout.id: (context) => DiagnoseLayout(),
        ResultLayout.id: (context) => ResultLayout(),
        HomeLayout.id: (context) => HomeLayout(data),
        MythLayout.id: (context) => MythLayout(),
        SymptomsLayout.id: (context) => SymptomsLayout(),
        PrecautionLayout.id: (context) => PrecautionLayout()
      },
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class Data {
  String url = "https://api.covid19india.org/data.json";

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print('Data received');
      var covidData = jsonDecode(response.body);
      return covidData;
    } else {
      print('Data not received. Failure code : ${response.statusCode}');
    }
  }
}

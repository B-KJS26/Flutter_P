import 'dart:convert';

import '../test.dart';
import 'package:http/http.dart' as http;

class ApisProviders {
  Uri uri = Uri.parse("http://13.125.225.199:8001/api/school/neisAPI/schedule?year=2022&month=9");

  Future<List<Apis>> getApis() async {
    List<Apis> apis = [];

    final response = await http.get(uri);

    if(response.statusCode == 200) {
      apis = jsonDecode(response.body)['Schedule_Day'].map<Apis>(
        (schedule) {
        return Apis.fromMap(schedule);
        }
      ).toList();
    }
    return apis;
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Schedulea> fechInfo() async {
  var url = 'http://44.202.22.220:8088/api/school/neisAPI/schedule?year=2022&month=9';
  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200) {
    print('Yes');
    print(json.decode(response.body));
    return Schedulea.fromJson(json.decode(response.body));
  } else {
    throw Exception('No');
  }
}

class Schedulea {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;
  String? s15;
  String? s16;
  String? s17;
  String? s18;
  String? s19;
  String? s20;
  String? s21;
  String? s22;
  String? s23;
  String? s24;
  String? s25;
  String? s26;
  String? s27;
  String? s28;
  String? s29;
  String? s30;
  String? year;
  String? month;
  int? day;
  String? today;
}

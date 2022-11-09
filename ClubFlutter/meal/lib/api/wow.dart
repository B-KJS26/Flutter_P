import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  String firstday = "";
  String seconday = "";
  String thirday = "";
  String fourthday = "";
  String fifthday = "";
  String sixthday = "";
  String sevenday = "";
  String eightday = "";
  String nineday = "";
  String tenday = "";


  Future<void> fetchPost() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8001/api/school/neisAPI/schedule?year=2022&month=11'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      firstday = parsingData['Schedule_Day']['1'];
      seconday = parsingData['Schedule_Day']['2'];
      thirday = parsingData['Schedule_Day']['3'];
      fourthday = parsingData['Schedule_Day']['4'];
      fifthday = parsingData['Schedule_Day']['5'];
      sixthday = parsingData['Schedule_Day']['6'];
      sevenday = parsingData['Schedule_Day']['7'];
      eightday = parsingData['Schedule_Day']['8'];
      nineday = parsingData['Schedule_Day']['9'];
      tenday = parsingData['Schedule_Day']['10'];
    });
    print(parsingData.statusCode);
    print(firstday);
    if (response.statusCode == 200) {
      print(parsingData);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                fetchPost();
              },
              child: Text(firstday)), 
              Text(firstday, style: const TextStyle(color: Colors.black, fontSize: 25),)
        ],
      ),
    );
  }
}

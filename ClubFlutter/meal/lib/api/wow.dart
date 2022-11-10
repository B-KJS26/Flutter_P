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
  String fday = "";
  String sday = "";
  String tday = "";
  String foday = "";
  String fiday = "";
  String sixday = "";
  String sevday = "";
  String eday = "";
  String nday = "";
  String teday = "";


  Future<void> fetchPost() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8001/api/school/neisAPI/schedule?year=2022&month=11'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      fday = parsingData['Schedule_Day']['1'];
      sday = parsingData['Schedule_Day']['2'];
      tday = parsingData['Schedule_Day']['3'];
      foday = parsingData['Schedule_Day']['4'];
      fiday = parsingData['Schedule_Day']['5'];
      sixday = parsingData['Schedule_Day']['6'];
      sevday = parsingData['Schedule_Day']['7'];
      eday = parsingData['Schedule_Day']['8'];
      nday = parsingData['Schedule_Day']['9'];
      teday = parsingData['Schedule_Day']['10'];
    });
    print(parsingData.statusCode);
    print(fday);
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
              child: Text(fday)), 
              Text(fday, style: const TextStyle(color: Colors.black, fontSize: 25),),
              Text(sday, style: const TextStyle(color: Colors.black, fontSize: 25),),
              Text(tday, style: const TextStyle(color: Colors.black, fontSize: 25),),
              Text(foday, style: const TextStyle(color: Colors.black, fontSize: 25),),
              Text(fiday, style: const TextStyle(color: Colors.black, fontSize: 25),),
              Text(sixday, style: const TextStyle(color: Colors.black, fontSize: 25),),
        ],
      ),
    );
  }
}

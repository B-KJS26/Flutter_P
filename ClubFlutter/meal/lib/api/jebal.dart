import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'splashed.dart';

class Jebal extends StatefulWidget {
  const Jebal({Key? key}) : super(key: key);

  @override
  State<Jebal> createState() => _JebalState();
}

class _JebalState extends State<Jebal> {
  String fday = "";

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Splashed(),
      ));
    });
    fetchPost();
    
  }
  Future<void> fetchPost() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8001/api/school/neisAPI/schedule?year=2022&month=11'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      fday = parsingData['Schedule_Day']['1'];
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
              Text(fday, style: const TextStyle(color: Colors.black, fontSize: 25),),
        ],
      ),
    );
  }
}

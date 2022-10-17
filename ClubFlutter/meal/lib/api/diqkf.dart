import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HaksaWidget extends StatelessWidget {
  const HaksaWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String result = '';
  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Example"),
      ),
      body: Container(
        child: Center(
          child: data.length == 0
              ? Text(
                  "데이터가 없습니다",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        child: Column(
                          children: [
                            Text(data[index]["1"].toString()),
                            Text(data[index]["2"].toString()),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: data.length,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'http://13.125.225.199:8001/api/school/neisAPI/schedule?year=2022&month=9');
    var response = await http.get(url);
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON["Schedule_Day"];
      data.addAll(result);
    });
    return response.body;
  }
}

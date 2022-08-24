import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TextClass {
  String title;
  TextClass({required this.title});
}
void main() {
  runApp(MaterialApp(
    title: 'Jo',
    home: Scaffold(body: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Center(
      child: FutureBuilder<TextClass>(
        future: (() async {
          final res =
            await http.get(Uri.parse('http://127.0.0.1:8080/api/school/neisAPI/meal/breakfast'));
          return TextClass(title: json.decode(res.body)['title']);
        })(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _AlarmState();
}

class _AlarmState extends State<Search> {
  void lovingcats() async {
    final String uri =
        "https://maplestory.nexon.com/N23Ranking/World/Total?c=보람둘이&w=0";
    http.Response response = await http.get(Uri.parse(uri));
    dom.Document document = parser.parse(response.body);
    List<dom.Element> keywordElements =
        document.querySelectorAll('.search_com_chk');
    List<Map<String, dynamic>> keywords = [];
    for (var element in keywordElements) {
      dom.Element? link = element.querySelector('.char_img');
      keywords.add({'rank': link?.attributes['src']});
    }
    print(keywords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search User", style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: Container(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  lovingcats();
                },
                child: Text('yo')),
          ],
        ),
      ),
    );
  }
}

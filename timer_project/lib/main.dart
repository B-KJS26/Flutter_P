import 'bottombar.dart';
import 'profile.dart';
import 'search.dart';
import 'package:flutter/material.dart';
import 'model.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Timer',
    home: const TimerPage(),
  ));
}

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //바텀바 코드
        length: 2,
        child: Scaffold(
            body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Search(),
                Profile(),
              ], //각각 home, community, meta, chat, user로 이동할수 있게 함
            ),
            bottomNavigationBar: Bottom.bottomBar()));
  }
}

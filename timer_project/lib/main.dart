import 'package:provider/provider.dart';
import 'package:timer_project/provider/provider.dart';

import 'bottombar.dart';
import 'profile.dart';
import 'search.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'model.dart';

void main() async {
  runApp(const MyPage());
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Userinfos>(
          create: (_) => Userinfos(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timer',
        home: const TimerPage(),
      ),
    );
  }
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

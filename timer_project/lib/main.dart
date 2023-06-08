import 'dart:async';
import 'package:timer_project/countdown.dart';
import 'package:timer_project/worldtime.dart';
import 'timer.dart';
import 'alarm.dart';
import 'package:flutter/material.dart';

void main() {
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
  int _currentIndex = 0;
  final List<Widget> _children = const [
    Timers(),
    Alarm(),
    Countdown(),
    WorldTime(),
  ];

  void chooseIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: chooseIndex,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: 'Timer',
            icon: Icon(Icons.timer),
          ),
          BottomNavigationBarItem(
              label: 'Alarm',
              icon: Icon(Icons.notifications_none),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              label: 'Countdown',
              icon: Icon(Icons.hourglass_bottom),
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
              label: 'WorldTime',
              icon: Icon(Icons.public),
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}

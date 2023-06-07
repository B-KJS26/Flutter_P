import 'package:flutter/material.dart';

class Timers extends StatefulWidget {
  const Timers({super.key});

  @override
  State<Timers> createState() => _TimersState();
}

class _TimersState extends State<Timers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer App'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('타이머'),
          ElevatedButton(onPressed: () {}, child: Text('시작!')),
        ],
      )),
    );
  }
}

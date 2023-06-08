import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Timers extends StatefulWidget {
  const Timers({super.key});

  @override
  State<Timers> createState() => _TimersState();
}

class _TimersState extends State<Timers> {
  int _timerCount = 0;
  int _timerCount1 = 0;
  int _timerCount2 = 0;
  bool _iconpress = false;
  late Timer timer = timer;

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Timer", style: TextStyle(fontSize: 30)),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$_timerCount",
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    " : $_timerCount1",
                    style: const TextStyle(fontSize: 50),
                  ),
                  Text(
                    " : $_timerCount2",
                    style: const TextStyle(fontSize: 50),
                  ),
                  const Text(
                    "",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _iconpress = !_iconpress;
                      });
                      if (_iconpress) {
                        timer = Timer.periodic(
                            const Duration(milliseconds: 1000), (timer) {
                          setState(() {
                            _timerCount2++;
                            if (_timerCount2 == 60) {
                              _timerCount2 = 0;
                              _timerCount1++;
                              if (_timerCount1 == 60) {
                                _timerCount1 = 0;
                                _timerCount++;
                              }
                            }
                          });
                        });
                      } else {
                        timer.cancel();
                      }
                    },
                    icon: Icon(_iconpress ? Icons.stop : Icons.play_arrow),
                    iconSize: 50,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _timerCount = 0;
                        _timerCount1 = 0;
                        _timerCount2 = 0;
                        _iconpress = false;
                        timer.cancel();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent),
                    icon: Icon(Icons.restore),
                    iconSize: 45,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

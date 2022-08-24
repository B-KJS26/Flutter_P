import 'package:flutter/material.dart';
import 'dart:ui';

class Sigan extends StatelessWidget {
  const Sigan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'API시간표',
      debugShowCheckedModeBanner: false,
      home: Siganapi(),
    );
  }
}

class Siganapi extends StatefulWidget {
  const Siganapi({Key? key}) : super(key: key);

  @override
  State<Siganapi> createState() => _SiganapiState();
}

class _SiganapiState extends State<Siganapi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.27,
            child: Row(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 70),
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image.asset('assets/images/haks.png'),
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9), //테두리
                      borderRadius: BorderRadius.circular(22),
                      border:
                          Border.all(color: const Color(0xffF9F9F9), width: 7),
                      boxShadow: [
                        // ignore: prefer_const_constructors
                        BoxShadow(
                          color: Colors.indigo.shade200,
                          offset: const Offset(6.0, 8.0),
                          blurRadius: 2.0,
                          spreadRadius: 0.3,
                        ),
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                  child: Column(
                    children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: const Text(
                          '시간표',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: const Text(
                          '2학년 1반',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            color: Color(0xff9EC3FF),
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}

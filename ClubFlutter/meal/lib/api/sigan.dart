// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:meal/splash/splashed.dart';
import 'package:meal/api/timetable.dart';

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
  String result = '';
  bool isMonday = true;
  bool isTuesday = false;
  bool isWednesday = false;
  bool isThursday = false;
  bool isFriday = false;
  late List<bool> isSelected;
  bool isLoading = true;
  String monday1 = "";
  String MSub = "";
  String Tuseday = "";
  String Wednesday = "";
  String Thursday = "";
  String Friday = "";
  @override
  void initState() {
    isSelected = [isMonday, isTuesday, isWednesday, isThursday, isFriday];
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8002/api/school/neisAPI/timeline?grade=2&classs=2'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      isLoading = false;
      monday1 = parsingData['1, study'];
    });
    
    if (response.statusCode == 200) {
      print('Success');
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? Splashed()
          : Column(
              children: [
                Container(
                  width: 430.w,
                  height: 180.h,
                  child: Stack(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        margin: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                        width: 90.w,
                        height: 80.h,
                        child: Image.asset(
                          'assets/images/sigan.png',
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9), //테두리
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                                color: const Color(0xffF9F9F9), width: 7),
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
                        margin: const EdgeInsets.fromLTRB(105, 28, 0, 0),
                        child: Column(
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: const Text(
                                '시간표',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(12, 10, 0, 0),
                              child: const Text(
                                '2학년 1반',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 105,
                        left: 40.w,
                        child: Row(
                          children: [
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: 35,
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isMonday = true;
                                    isTuesday = false;
                                    isWednesday = false;
                                    isThursday = false;
                                    isFriday = false;
                                  });
                                },
                                child: Text(
                                  "월",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    primary: isMonday
                                        ? Color(0xffFFEE95)
                                        : Color(0xff9EC3FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    padding: EdgeInsets.only(left: 0)),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            // ignore: sized_box_for_whitespace
                            Container(
                              width: 35,
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isMonday = false;
                                    isTuesday = true;
                                    isWednesday = false;
                                    isThursday = false;
                                    isFriday = false;
                                  });
                                },
                                child: Text(
                                  "화",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    minimumSize: Size(50, 50),
                                    primary: isTuesday
                                        ? Color(0xffFFEE95)
                                        : Color(0xff9EC3FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    padding: EdgeInsets.only(left: 0)),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isMonday = false;
                                    isTuesday = false;
                                    isWednesday = true;
                                    isThursday = false;
                                    isFriday = false;
                                  });
                                },
                                child: Text(
                                  "수",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    minimumSize: Size(50, 50),
                                    primary: isWednesday
                                        ? Color(0xffFFEE95)
                                        : Color(0xff9EC3FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    padding: EdgeInsets.only(left: 0)),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isMonday = false;
                                    isTuesday = false;
                                    isWednesday = false;
                                    isThursday = true;
                                    isFriday = false;
                                  });
                                },
                                child: Text(
                                  "목",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  minimumSize: Size(50, 50),
                                  primary: isThursday
                                      ? Color(0xffFFEE95)
                                      : Color(0xff9EC3FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.only(left: 0),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 22,
                            ),
                            Container(
                              width: 35,
                              height: 35,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isMonday = false;
                                    isTuesday = false;
                                    isWednesday = false;
                                    isThursday = false;
                                    isFriday = true;
                                  });
                                },
                                child: Text(
                                  "금",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: isFriday
                                      ? Color(0xffFFEE95)
                                      : Color(0xff9EC3FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.only(left: 0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
                Row(
      mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  children: [
                    Container(
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFEE95),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 18.w,
                    ),
                    Text('1',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                    Text(
                      monday1
                    ),
                  ],)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFEE95),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 18.w,
                    ),
                    Text('2',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                  ],)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFEE95),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 18.w,
                    ),
                    Text('3',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                  ],)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFEE95),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 18.w,
                    ),
                    Text('4',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                  ],)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFEE95),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 18.w,
                    ),
                    Text('5',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                  ],)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFEE95),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 18.w,
                    ),
                    Text('6',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                  ],)
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 50.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xffFFEE95),
                  ),
                  child: Row(children: [
                    SizedBox(
                      width: 18.w,
                    ),
                    Text('7',
                    style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                  ],)
                ),
                  ]
                  
                ),
              )
              
              
            ],
          ),
              ],
            ),
    );
  }
}

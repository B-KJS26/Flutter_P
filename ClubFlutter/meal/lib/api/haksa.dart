// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:http/http.dart';
import 'package:meal/splash/splashed.dart';
// ignore: unused_import
import 'package:meal/post.dart';
// ignore: unused_import
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class Haksa extends StatelessWidget {
  const Haksa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 736),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: '학사일정',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ignore: unnecessary_new
var now = new DateTime.now();

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;
  String fday = "";
  @override
  initState(){
    super.initState();
    fetchPosth();
  }
  Future<void> fetchPosth() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8001/api/school/neisAPI/schedule?year=2022&month=11'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      fday = parsingData['Schedule_Day']['1'];
      isLoading = false;
    });
    if (response.statusCode == 200) {
      print('Success');
    } else {
      throw Exception('Failed to load post');
    }
  }
  @override
  String Month = DateFormat('M').format(now);
  String Day = DateFormat('d').format(now);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: isLoading ? Splashed() : Column(
        children: [
          //FLEXIBLE을 이용하여 화면이 어떻게 달라져도 자동
          Flexible(
            child: Row(
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  height: 75.h,
                  child: Image.asset('assets/images/haks.png'),
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9), //테두리
                      borderRadius: BorderRadius.circular(22),
                      border:
                          Border.all(color: const Color(0xffF9F9F9), width: 7),
                      boxShadow: [
                        // ignore: prefer_const_constructors
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(0, 5.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.3,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-1.0, -1.0),
                          blurRadius: 10.0,
                          spreadRadius: 1.0,
                        ),
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: Text(
                    '학사일정 \n'
                    '$Month월 ',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 380.w,
            height: 530.h,
            child: Column(
              children: [
                Container(
                  width: 340.w,
                  height: 30.h,
                  margin: EdgeInsets.only(top: 110.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SUN  ',
                        style: TextStyle(
                          color: Colors.red,
                        ),),
                        Text(' MON  '),
                        Text(' TUE  '),
                        Text(' WED  '),
                        Text(' THU  '),
                        Text(' FRI  '),
                        Text(' SAT',
                        style: TextStyle(
                          color: Colors.blue,
                        ),)
                      ]),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), //모서리를 둥글게
            border: Border.all(color: Colors.black, width: 1),
                      ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/Cal.png'),
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(0, 20.0),
                  blurRadius: 30.0,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

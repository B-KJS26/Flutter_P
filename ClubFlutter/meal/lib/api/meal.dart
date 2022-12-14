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
import 'package:http/http.dart' as http;

class Meal extends StatelessWidget {
  const Meal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 736),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: '급식표',
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
  bool isBreakfast = true;
  bool isLunch = false;
  bool isDinner = false;
  bool isLoading = true;
  String breakfast = "";
  String lunch = "";
  String dinner = "";
  String Month = DateFormat('M').format(now);
  String Day = DateFormat('d').format(now);
  String days = DateFormat('d').format(now);
  var theDay;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPostm();
    theDay = int.parse(days) - 1;
  }

  Future<void> fetchPostm() async {
    final response = await http.get(Uri.parse(
        'http://13.125.225.199:8000/api/school/neisAPI/meal?year=2022&month=$Month'));
    var parsingData = jsonDecode(utf8.decode(response.bodyBytes));
    setState(() {
      breakfast = parsingData['School_Meal'][theDay]['day'][0]['조식'];
      lunch = parsingData['School_Meal'][theDay]['day'][1]['중식'];
      dinner = parsingData['School_Meal'][theDay]['day'][2]['석식'];
      isLoading = false;
    });
    if (response.statusCode == 200) {
      print('Success');
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  final standardDeviceWidth = 360;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: isLoading
          ? Splashed()
          : Column(
              children: [
                //FLEXIBLE을 이용하여 화면이 어떻게 달라져도 자동
                Flexible(
                  child: Row(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        height: 75.h,
                        child: Image.asset('assets/images/spoonandfork.png'),
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F9F9), //테두리
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(
                                color: const Color(0xffF9F9F9), width: 7),
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
                          '급식 \n'
                          '$Month월 '
                          '$Day일',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            margin: EdgeInsets.only(top: 110.h),
                            width: 80.w,
                            height: 40.h,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isBreakfast = true;
                                  isLunch = false;
                                  isDinner = false;
                                });
                              },
                              child: Text(
                                "아침",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sm,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: isBreakfast
                                      ? Color(0xffFFEE95)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.only(left: 0)),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 110.h),
                            width: 80.w,
                            height: 40.h,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isBreakfast = false;
                                  isLunch = true;
                                  isDinner = false;
                                });
                              },
                              child: Text(
                                "점심",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sm,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: isLunch
                                      ? Color(0xffFFEE95)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.only(left: 0)),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 110.h),
                            width: 80.w,
                            height: 40.h,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isBreakfast = false;
                                  isLunch = false;
                                  isDinner = true;
                                });
                              },
                              child: Text(
                                "저녁",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.sm,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: isDinner
                                      ? Color(0xffFFEE95)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)),
                                  padding: EdgeInsets.only(left: 0)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        child: Text(
                          isBreakfast
                              ? breakfast
                              : isLunch
                                  ? lunch
                                  : dinner,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
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

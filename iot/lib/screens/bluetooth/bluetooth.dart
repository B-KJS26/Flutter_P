import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Nonblue extends StatefulWidget {
  const Nonblue({super.key});

  @override
  State<Nonblue> createState() => _NonblueState();
}

class _NonblueState extends State<Nonblue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 19.w, top: 14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Yu",
                  style: TextStyle(
                      fontSize: 30.sp, color: const Color(0xff18A6F5)),
                ),
                Text(
                  "uri",
                  style: TextStyle(
                      fontSize: 30.sp, color: const Color(0xff17C81E)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130.h,
          ),
          Container(
            width: 350.w,
              child: Image.asset('images/bluetooth.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
            '블루투스 ',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            ),
            Text(
              '연결을 해주십시오',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],)
        ],
      )),
    );
  }
}

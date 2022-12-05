import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mileage extends StatefulWidget {
  const Mileage({super.key});

  @override
  State<Mileage> createState() => _MileageState();
}

class _MileageState extends State<Mileage> {
  bool pressed1 = true;
  bool pressed2 = false;
  bool pressed3 = false;
  bool pressed4 = false;
  bool pressed5 = false;

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
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 19.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          pressed1 = true;
                          pressed2 = false;
                          pressed3 = false;
                          pressed4 = false;
                          pressed5 = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "상품권",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: pressed1
                                    ? Colors.black
                                    : const Color(0xffB1B1B1)),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          pressed1
                              ? Container(
                                  width: 61.w,
                                  height: 2.h,
                                  color: Colors.black,
                                )
                              : Container(
                                  height: 2.h,
                                  width: 61.w,
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          pressed1 = false;
                          pressed2 = true;
                          pressed3 = false;
                          pressed4 = false;
                          pressed5 = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "편의점",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: pressed2
                                    ? Colors.black
                                    : const Color(0xffB1B1B1)),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          pressed2
                              ? Container(
                                  width: 61.w,
                                  height: 2.h,
                                  color: Colors.black,
                                )
                              : Container(
                                  height: 2.h,
                                  width: 61.w,
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          pressed1 = false;
                          pressed2 = false;
                          pressed3 = true;
                          pressed4 = false;
                          pressed5 = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "카페, 베이커리",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: pressed3
                                    ? Colors.black
                                    : const Color(0xffB1B1B1)),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          pressed3
                              ? Container(
                                  width: 121.w,
                                  height: 2.h,
                                  color: Colors.black,
                                )
                              : Container(
                                  height: 2.h,
                                  width: 121.w,
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          pressed1 = false;
                          pressed2 = false;
                          pressed3 = false;
                          pressed4 = true;
                          pressed5 = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "외식",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: pressed4
                                    ? Colors.black
                                    : const Color(0xffB1B1B1)),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          pressed4
                              ? Container(
                                  width: 51.w,
                                  height: 2.h,
                                  color: Colors.black,
                                )
                              : Container(
                                  height: 2.h,
                                  width: 51.w,
                                )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          pressed1 = false;
                          pressed2 = false;
                          pressed3 = false;
                          pressed4 = false;
                          pressed5 = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            "문화생활",
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: pressed5
                                    ? Colors.black
                                    : const Color(0xffB1B1B1)),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          pressed5
                              ? Container(
                                  width: 91.w,
                                  height: 2.h,
                                  color: Colors.black,
                                )
                              : Container(
                                  height: 2.h,
                                  width: 91.w,
                                )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
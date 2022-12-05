import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Trash extends StatefulWidget {
  const Trash({super.key});

  @override
  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  final List<Widget> carouselList = [];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 19.w, bottom: 39.h, top: 48.h),
                  child: Text(
                    "분리수거 선택",
                    style:
                        TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),

            Container(
              width: 260.w,
              height: 400.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ],
                  ),
            )
            //     Container(

            // child: CarouselSlider(
            //   options: CarouselOptions(
            //     autoPlay: true,
            //     aspectRatio: 2.0,
            //     enlargeCenterPage: true,
            //   ),
            //   items: carouselList,
            // ),)
          ],
        ),
      ),
    );
  }
}
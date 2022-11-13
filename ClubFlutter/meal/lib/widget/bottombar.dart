import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal/common/common.dart';

class Bottom {
  static Widget bottomBar() {
    return SizedBox(
      height: 60.h,
      child: Material(
        color: Colors.transparent,
        child: TabBar(
          labelColor: CommonColor.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 25.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.home,
                size: 25.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.home,
                size: 25.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.groups,
                size: 25.h,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.school,
                size: 25.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
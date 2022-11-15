import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal/api/wow.dart';
import 'widget/bottombar.dart';
import 'package:flutter/services.dart';
import 'api/haksa.dart';
import 'api/sigan.dart';
import 'api/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Welcome',
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              body: const TabBarView(
                children: [Meal(), Haksa(), Sigan()],
              ),
                bottomNavigationBar: Bottom.bottomBar())),
      ),
    );
  }
}
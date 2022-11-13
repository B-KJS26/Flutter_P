import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'jebal.dart';
class Splashed extends StatefulWidget {
  const Splashed ({Key? key}) : super(key: key);

  @override
  State<Splashed> createState() => _SplashedState();
}

class _SplashedState extends State<Splashed> {
    @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Splashed(),
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    final String imageLogoName = 'assets/images/public/PurpleLogo.svg';
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor:1.0),
        child: new Scaffold(
          backgroundColor: const Color(0xff6F22D2),
          body: new Container(
            //height : MediaQuery.of(context).size.height,
            //color: kPrimaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: screenHeight * 0.384375),
                Container(
                  child: SvgPicture.asset(
                    imageLogoName,
                    width: screenWidth * 0.616666,
                    height: screenHeight * 0.0859375,
                  ),
                ),
                Expanded(child: SizedBox()),
                Align(
                  child: Text("© Copyright 2020, 내방니방(MRYR)",
                      style: TextStyle(
                        fontSize: screenWidth*( 14/360), color: Color.fromRGBO(255, 255, 255, 0.6),)
                  ),
                ),
                SizedBox( height: MediaQuery.of(context).size.height*0.0625,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
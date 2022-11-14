import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Splashed extends StatefulWidget {
  const Splashed ({Key? key}) : super(key: key);

  @override
  State<Splashed> createState() => _SplashedState();
}

class _SplashedState extends State<Splashed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,//Colors.amber
      body: Center(
        child: SpinKitRing(
          color: Colors.lightBlue,
            size: 80.0,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iot/screens/bluetooth/bluetooth.dart';
import 'package:iot/screens/bottombar/mileage.dart';
import 'package:iot/screens/bottombar/trash.dart';
import 'package:iot/screens/bottombar/user.dart';
import 'package:iot/screens/bottombar/user2.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});
  
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  var _currentIndex = 0;

  final List<Widget> _children = [
    const Trash(),
    const Mileage(),
    const User(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: _currentIndex,
          children: _children,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Colors.black.withOpacity(0.1), width: 1.w))),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (i) => setState(() => {_currentIndex = i}),
            items: [
              ///
              SalomonBottomBarItem(
                icon: const Icon(Icons.restore_from_trash),
                title: const Text("trash"),
                selectedColor: Colors.purple,
              ),

              /// mileage
              SalomonBottomBarItem(
                icon: const Icon(Icons.currency_exchange),
                title: const Text("mileage"),
                selectedColor: Colors.teal,
              ),

              /// user
              SalomonBottomBarItem(
                icon: const Icon(Icons.account_circle),
                title: const Text("user"),
                selectedColor: Colors.pink,
              ),
            ],
          ),
        ));
  }
}
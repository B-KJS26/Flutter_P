import 'package:flutter/material.dart';

class Bottom {
  static Widget bottomBar() {
    return SizedBox(
      height: 40,
      child: Material(
        color: Colors.transparent, //바텀바의 색깔을 부모 위젯의 색과 같게 만들어주는 코드
        child: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

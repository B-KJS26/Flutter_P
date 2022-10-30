import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Apis{
  late String one;
  late String two;

  Apis({
    required this.one,
    required this.two
  });

  Apis.fromMap(Map<String, dynamic>? map){
    one = map?['1'] ?? '';
    two = map?['2'] ?? '';
  }
}
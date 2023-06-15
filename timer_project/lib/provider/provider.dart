import 'package:flutter/material.dart';

class Userinfos with ChangeNotifier {
  String _name = "";
  String _role = "";
  String _level = "";
  String _profile = "";
  bool _judgement = false;

  String get name => _name;
  String get role => _role;
  String get level => _level;
  String get profile => _profile;
  bool get judgement => _judgement;

  void inputname(String chname1) {
    _name = chname1;
    notifyListeners();
  }

  void inputrole(String chname2) {
    _role = chname2;
    notifyListeners();
  }

  void inputlevel(String chlevel) {
    _level = chlevel;
    notifyListeners();
  }

  void inputprofile(String chprofile) {
    _profile = chprofile;
    notifyListeners();
  }

  void inputjudgement(bool chjudgement) {
    _judgement = chjudgement;
    notifyListeners();
  }
}

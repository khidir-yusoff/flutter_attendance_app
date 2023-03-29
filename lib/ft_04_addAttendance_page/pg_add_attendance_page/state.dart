import 'package:flutter/material.dart';

class FAAAddAttendancePageState extends ChangeNotifier {
  String? _name;
  String? _phone;
  DateTime? _dateTime;

  String? get name => _name;
  set name(String? name) {
    _name = name;
    notifyListeners();
  }

  String? get phone => _phone;
  set phone(String? phone) {
    _phone = phone;
    notifyListeners();
  }

  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  bool _updateTextController = false;

  bool get updateTextController => _updateTextController;

  @protected
  void updateText(void Function() update) {
    update();
    _updateTextController = true;
  }
}

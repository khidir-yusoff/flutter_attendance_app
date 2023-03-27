import 'package:flutter/material.dart';

class FAAAddAttendancePageState extends ChangeNotifier {
  String? _title;
  DateTime? _dateTime;

  String? get title => _title;
  set title(String? title) {
    _title = title;
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

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FAAMainPageState extends ChangeNotifier {
  int _timeFormat = 0;

  int get timeFormat => _timeFormat;
  set timeFormat(int timeFormat) {
    _timeFormat = timeFormat;
    _setFormatting(timeFormat);
    notifyListeners();
  }
}

Future<void> _setFormatting(int timeFormat) async {
  final formatting = await SharedPreferences.getInstance();

  formatting.setInt('timeFormat', timeFormat);
}

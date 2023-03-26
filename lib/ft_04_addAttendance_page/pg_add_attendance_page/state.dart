import 'package:flutter/material.dart';

class FAAAddAttendancePageState extends ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();

  bool _showDate = false;
  bool _showTime = false;
  bool _showDateTime = false;

  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime selectedDate) {
    _selectedDate = selectedDate;
    notifyListeners();
  }

  TimeOfDay get selectedTime => _selectedTime;
  set selectedTime(TimeOfDay selectedTime) {
    _selectedTime = selectedTime;
    notifyListeners();
  }

  DateTime get dateTime => _dateTime;
  set dateTime(DateTime dateTime) {
    _dateTime = dateTime;
    notifyListeners();
  }

  bool get showDate => _showDate;
  set showDate(bool showDate) {
    _showDate = showDate;
    notifyListeners();
  }

  bool get showTime => _showTime;
  set showTime(bool showTime) {
    _showTime = showTime;
    notifyListeners();
  }

  bool get showDateTime => _showDateTime;
  set showDateTime(bool showDateTime) {
    _showDateTime = showDateTime;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class EventController {
  bool isDateSelected = false;
  DateTime dateToday = DateTime.now();
  String selectedDate = 'Choose date';

  bool isTimeSelected = false;
  String initialTime = 'Choose time';
  String displayTime;
  TimeOfDay selectedTime = TimeOfDay.now().replacing(minute: 30);
}

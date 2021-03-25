import 'package:flutter/material.dart';

class ScheduleController {
  bool isTimeSelected = false;

  DateTime dateToday = DateTime.now();
  String selectedDate = 'Choose date';

  String initialTime = 'Choose time';
  String displayTime;
  TimeOfDay selectedTime = TimeOfDay.now().replacing(minute: 30);
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web/Model/BeneficiaryModel.dart';
import 'package:web/Model/CaseModel.dart';
import 'package:web/Model/EventModel.dart';
import 'package:web/Model/ScheduleModel.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Model/UserModel.dart';
import 'package:web/Widgets/Validator/EmptyBeneficiaryScheduleWidget/EmptyBeneficiaryScheduleWidget.dart';

class Common {
  static DateTime currentDate;
  static String displayDate;

  static List<Widget> memberWidgetList = new List<Widget>();
  static List<UserModel> memberList = new List<UserModel>();

  static List<Widget> transactionWidgetList = new List<Widget>();
  static List<TransactionModel> transactionList = new List<TransactionModel>();

  static List<Widget> eventWidgetList = new List<Widget>();
  static List<EventModel> eventList = new List<EventModel>();

  static List<Widget> recentTransactionWidgetList = new List<Widget>();
  static List<TransactionModel> recentTransactionList = new List<TransactionModel>();

  static List<Widget> caseWidgetList = new List<Widget>();
  static List<CaseModel> caseList = new List<CaseModel>();

  static List<Widget> scheduleCaseWidgetList = new List<Widget>();
  static List<CaseModel> scheduleCaseList = new List<CaseModel>();

  static List<Widget> scheduleWidgetList = new List<Widget>();
  static List<ScheduleModel> scheduleList = new List<ScheduleModel>();

  static List<Widget> carriedOutScheduleWidgetList = new List<Widget>();
  static List<ScheduleModel> carriedOutScheduleList = new List<ScheduleModel>();

  static List<Widget> validatorBeneficiaryWidgetList = [EmptyBeneficiaryScheduleWidget()];
  static List<BeneficiaryModel> validatorBeneficiaryList = new List<BeneficiaryModel>();

  static String resetEmailAddress = "";
  static String selectedValidatorSchedule = "";
  static String selectedValidatorName = "";

  static TextStyle labelTextStyle = new TextStyle(
    fontSize: 16.0,
    fontFamily: 'StemRegular',
  );
  static TextStyle buttonTextStyle = new TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    fontFamily: 'StemMedium',
  );

  static Color disabledNavBarColor = Colors.black26;
  static Color hoverNavBarColor = Colors.black45;
  static Color enabledNavBarColor = Colors.black;

  static Map<String, dynamic> headers = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS"
  };

  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890`~!@#\$%^&*()_+-={}[]:"|;\'\\,./<>?';
  static Random rnd = Random();

  static String generatePassword(int length) => String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(rnd.nextInt(_chars.length))));

  static UserModel loggedInData;

  static List<String> months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  static String getAge(String dob) {
    DateTime now = DateTime.now();
    String yearString = dob[6] + dob[7] + dob[8] + dob[9];
    String monthString = dob[3] + dob[4];
    String dayString = dob[0] + dob[1];
    int yearInt = int.parse(yearString);
    int monthInt = int.parse(monthString);
    int dayInt = int.parse(dayString);
    DateTime birthday = DateTime(yearInt, monthInt, dayInt);
    double difference = now.difference(birthday).inDays / 365.5;
    int age = difference.toInt();

    return age.toString();
  }

  static setDate() {
    currentDate = new DateTime.now();
    String todayDay = DateFormat('EEEE').format(currentDate);
    String today = todayDay[0] + todayDay[1] + todayDay[2];

    String shownDate = today + ", " + currentDate.day.toString() + " " + months[currentDate.month - 1] + " " + currentDate.year.toString();

    displayDate = shownDate;
  }

  static String getDate() {
    String now = new DateTime.now().toString();
    String date = now[8] + now[9] + "/" + now[5] + now[6] + "/" + now[0] + now[1] + now[2] + now[3];
    return date;
  }

  static String convertNormalDate(String date) {
    String month = date[3] + date[4];
    int index = int.parse(month);
    String displayDate = date[0] + date[1] + " " + months[index - 1] + " " + date[6] + date[7] + date[8] + date[9];
    return displayDate;
  }

  static String convertDate(String date) {
    String month = date[5] + date[6];
    print(month);
    int index = int.parse(month);
    String displayDate = date[8] + date[9] + " " + months[index - 1] + " " + date[0] + date[1] + date[2] + date[3];
    return displayDate;
  }

  static String capitaliseOnlyFirstLetter(String text) {
    String output = "";

    for (int i = 0; i < text.length; i++) {
      i == 0 ? output += text[i].toUpperCase() : output += text[i].toLowerCase();
    }

    return output;
  }

  static int compareDate(String from, String to) {
    int fromDay = int.parse(from[0] + from[1]);
    int fromMonth = int.parse(from[3] + from[4]);
    int fromYear = int.parse(from[6] + from[7] + from[8] + from[9]);
    int fromHour = int.parse(from[10] + from[11]);
    int fromMinute = int.parse(from[13] + from[14]);
    DateTime dateFrom = new DateTime(fromYear, fromMonth, fromDay, fromHour, fromMinute);

    int toDay = int.parse(to[0] + to[1]);
    int toMonth = int.parse(to[3] + to[4]);
    int toYear = int.parse(to[6] + to[7] + to[8] + to[9]);
    int toHour = int.parse(to[10] + to[11]);
    int toMinute = int.parse(to[13] + to[14]);
    DateTime dateTo = new DateTime(toYear, toMonth, toDay, toHour, toMinute);

    return dateFrom.compareTo(dateTo);
  }

  static int compareDateFromDateFormat(String from, String to) {
    int fromDay = int.parse(from[8] + from[9]);
    int fromMonth = int.parse(from[5] + from[6]);
    int fromYear = int.parse(from[0] + from[1] + from[2] + from[3]);
    int fromHour = int.parse(from[11] + from[12]);
    int fromMinute = int.parse(from[14] + from[15]);
    DateTime dateFrom = new DateTime(fromYear, fromMonth, fromDay, fromHour, fromMinute);

    int toDay = int.parse(to[8] + to[9]);
    int toMonth = int.parse(to[5] + to[6]);
    int toYear = int.parse(to[0] + to[1] + to[2] + to[3]);
    int toHour = int.parse(to[11] + to[12]);
    int toMinute = int.parse(to[14] + to[15]);
    DateTime dateTo = new DateTime(toYear, toMonth, toDay, toHour, toMinute);

    return dateFrom.compareTo(dateTo);
  }

  static bool checkFutureDate(String rawDate) {
    int fromDay = int.parse(rawDate[0] + rawDate[1]);
    int fromMonth = int.parse(rawDate[3] + rawDate[4]);
    int fromYear = int.parse(rawDate[6] + rawDate[7] + rawDate[8] + rawDate[9]);
    int fromHour = int.parse(rawDate[10] + rawDate[11]);
    int fromMinute = int.parse(rawDate[13] + rawDate[14]);
    DateTime date = new DateTime(fromYear, fromMonth, fromDay, fromHour, fromMinute);
    if (date.compareTo(DateTime.now()) == 1) {
      return true;
    } else
      return false;
  }
}

class PasswordStrength {
  static int weak = -1;
  static int normal = 0;
  static int strong = 1;
}

class Generator {
  static List<String> alphabets = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  static List<String> symbols = ['@', '\$', '#', '%', '&'];
  static List<String> numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  static String generatePassword(int strength) {
    final _random = new Random();

    int smallAlphabetsLength = 0;
    int capitalAlphabetsLength = 0;
    int symbolsLength = 0;
    int numbersLength = 0;
    List<String> generatedPasswordList = [];
    String generatedPassword = "";

    if (strength == -1) {
      smallAlphabetsLength = 3;
      capitalAlphabetsLength = 3;
      symbolsLength = 1;
      numbersLength = 1;
    } else if (strength == 0) {
      smallAlphabetsLength = 4;
      capitalAlphabetsLength = 4;
      symbolsLength = 2;
      numbersLength = 2;
    } else if (strength == 1) {
      smallAlphabetsLength = 5;
      capitalAlphabetsLength = 5;
      symbolsLength = 3;
      numbersLength = 3;
    }

    for (int i = 0; i < smallAlphabetsLength; i++) {
      generatedPasswordList.add(alphabets[_random.nextInt(alphabets.length)]);
    }
    for (int i = 0; i < capitalAlphabetsLength; i++) {
      generatedPasswordList.add(alphabets[_random.nextInt(alphabets.length)].toUpperCase());
    }
    for (int i = 0; i < symbolsLength; i++) {
      generatedPasswordList.add(symbols[_random.nextInt(symbols.length)]);
    }
    for (int i = 0; i < numbersLength; i++) {
      generatedPasswordList.add(numbers[_random.nextInt(numbers.length)]);
    }

    generatedPasswordList.shuffle();

    for (var char in generatedPasswordList) {
      generatedPassword += char;
    }

    return generatedPassword;
  }
}

class SetSchedule {
  static String selectedDate = "null";
  static String selectedTime = "null";
  static List<UserModel> mobileUsers = new List<UserModel>();
  static List<String> stringMobileUsers = new List<String>();
  static String selectedUserID = "null";
}

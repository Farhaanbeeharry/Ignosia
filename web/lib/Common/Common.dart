import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Model/UserModel.dart';

class Common {
  static DateTime currentDate;
  static String displayDate;

  static List<Widget> memberWidgetList = new List<Widget>();
  static List<UserModel> memberList = new List<UserModel>();

  static List<Widget> transactionWidgetList = new List<Widget>();
  static List<TransactionModel> transactionList = new List<TransactionModel>();

  static String resetEmailAddress = "";

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

  static setDate() {
    currentDate = new DateTime.now();
    String todayDay = DateFormat('EEEE').format(currentDate);

    String shownDate = todayDay + ", " + currentDate.day.toString() + " " + months[currentDate.month - 1] + " " + currentDate.year.toString();

    displayDate = shownDate;
  }

  static String getDate() {
    String now = new DateTime.now().toString();
    String date = now[8] + now[9] + "/" + now[5] + now[6] + "/" + now[0] + now[1] + now[2] + now[3];
    return date;
  }

  static String convertDate(String date) {
    String month = date[5] + date[6];
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

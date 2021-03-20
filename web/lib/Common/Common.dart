import 'package:flutter/material.dart';

class Common {
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
}

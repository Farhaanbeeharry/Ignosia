import 'package:flutter/material.dart';
import 'package:web/Widgets/Dashboard/Dashboard.dart';
import 'package:web/Widgets/ForgotPassword/ForgotPasswordView.dart';
import 'package:web/Widgets/Homepage/Homepage.dart';
import 'package:web/Widgets/NewPassword/NewPasswordView.dart';
import 'package:web/Widgets/Signup/SignupView.dart';

import 'Widgets/Login/LoginView.dart';

void main() {
  runApp(
    new MaterialApp(
      initialRoute: '/Homepage',
      routes: {
        '/Login': (context) => LoginPage(),
        '/ForgotPassword': (context) => ForgotPasswordView(),
        '/SignUp': (context) => SignupView(),
        '/Homepage': (context) => Homepage(),
        '/NewPassword': (context) => NewPassword(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

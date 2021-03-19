import 'package:flutter/material.dart';
import 'package:web/Widgets/ForgotPassword/ForgotPasswordView.dart';
import 'package:web/Widgets/Signup/SignupView.dart';

import 'Widgets/Dashboard/DashboardView.dart';
import 'Widgets/Login/LoginView.dart';

void main() {
  runApp(
    new MaterialApp(
      initialRoute: '/LogIn',
      routes: {
        '/LogIn': (context) => LoginPage(),
        '/ForgotPassword': (context) => ForgotPasswordView(),
        '/SignUp': (context) => SignupView(),
        '/Dashboard': (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

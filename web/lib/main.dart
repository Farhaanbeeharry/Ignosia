import 'package:flutter/material.dart';
import 'package:web/Widgets/ForgotPassword/ForgotPasswordView.dart';
import 'package:web/Widgets/Signup/SignupView.dart';

import 'Widgets/Login/LoginView.dart';

void main() {
  runApp(
    new MaterialApp(
      initialRoute: '/SignUp',
      routes: {
        '/': (context) => LoginPage(),
        '/ForgotPassword': (context) => ForgotPasswordView(),
        '/SignUp': (context) => SignupView(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

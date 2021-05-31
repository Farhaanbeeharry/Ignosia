import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/Widgets/ForgotPassword/ForgotPasswordView.dart';
import 'package:web/Widgets/Homepage/Homepage.dart';
import 'package:web/Widgets/NewPassword/NewPasswordView.dart';
import 'package:web/Widgets/Signup/SignupView.dart';

import 'Widgets/Login/LoginView.dart';

void main() {
  final shortcuts = WidgetsApp.defaultShortcuts;
  shortcuts[LogicalKeySet(LogicalKeyboardKey.space)] = ActivateIntent();
  runApp(
    new MaterialApp(
      shortcuts: shortcuts,
      initialRoute: '/Login',
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

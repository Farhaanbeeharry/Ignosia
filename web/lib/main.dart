import 'package:flutter/material.dart';
import 'package:web/Widgets/ForgotPassword/ForgotPasswordView.dart';

import 'Widgets/Login/LoginView.dart';

void main() {
  runApp(
    new MaterialApp(
      initialRoute: '/ForgotPassword',
      routes: {
        '/': (context) => LoginPage(),
        '/ForgotPassword': (context) => ForgotPasswordView(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

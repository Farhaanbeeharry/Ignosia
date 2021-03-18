import 'package:flutter/material.dart';

class LoginController {
  Widget obscureTextIcon = Icon(Icons.visibility);
  bool obscureTextCheck = true;

  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
}

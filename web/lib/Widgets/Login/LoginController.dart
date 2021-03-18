import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginController {
  Widget obscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool obscureTextCheck = true;

  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
}

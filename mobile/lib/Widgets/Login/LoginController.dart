import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Common/Stem.dart';

class LoginController {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget loginBtn = Text(
    "Log in",
    style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: Stem.regular),
  );
}

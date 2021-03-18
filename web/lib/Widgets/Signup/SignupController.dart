import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupController {
  Widget passwordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool passwordObscureTextCheck = true;
  Widget confirmPasswordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool confirmPasswordObscureTextCheck = true;
  bool agreementBox = false;

  final signUpKey = GlobalKey<FormState>();

  Color agreementColor = Colors.black;
  Color errorAgreement = Colors.red;

  TextEditingController passwordController = new TextEditingController();

  DateTime dateToday = DateTime.now();
  String selectedDate = 'Date of birth';
}

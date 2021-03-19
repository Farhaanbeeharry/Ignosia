import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Encryptor.dart';
import 'package:web/Model/ResponseModel.dart';

class LoginController {
  Widget obscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool obscureTextCheck = true;

  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future<void> logIn(String emailAddress, String password, BuildContext context) async {
    password = Encrypt().encryptPassword(password);

    var body = {"emailAddress": emailAddress, "password": password};
    var apiResponse = await http.post(ApiUrl.getURL(ApiUrl.login), body: body);
    String stringResponse = apiResponse.body;
    Map<String, dynamic> mapResponse = jsonDecode(stringResponse);

    ResponseModel response = new ResponseModel().cast(mapResponse);

    if (response.success) {
      Navigator.pushNamed(context, '/Dashboard');
    } else if (!response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: "Login failed",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

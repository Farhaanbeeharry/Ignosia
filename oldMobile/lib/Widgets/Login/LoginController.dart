import 'package:mobile/Common/API.dart';
import 'package:mobile/Common/ApiUrl.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Encryptor.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/ResponseModel.dart';
import 'package:mobile/Model/UserModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool hasError = false;
  String error = "";

  Widget loginBtn = Text(
    "Log in",
    style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: Stem.regular),
  );

  Future<bool> login(String emailAddress, String password, BuildContext context) async {
    password = Encrypt().encryptPassword(password); //encrypt password
    emailAddress = emailAddress.toLowerCase();

    var body = {"emailAddress": emailAddress, "password": password};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.login), body);

    if (response.success) {
      Common.loggedInUserData = UserModel().fromJson(response.data);
      return true;
    } else {
      Alert(
        context: context,
        style: Common.errorAlertStyle,
        type: AlertType.error,
        title: "Login failed",
        desc: response.error,
        buttons: [
          DialogButton(
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: Stem.regular),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
      return false;
    }
  }
}

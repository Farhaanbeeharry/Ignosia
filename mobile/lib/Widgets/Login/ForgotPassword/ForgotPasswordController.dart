import 'package:Ignosia/Common/API.dart';
import 'package:Ignosia/Common/ApiUrl.dart';
import 'package:Ignosia/Common/Common.dart';
import 'package:Ignosia/Common/Encryptor.dart';
import 'package:Ignosia/Common/Stem.dart';
import 'package:Ignosia/Model/ResponseModel.dart';
import 'package:Ignosia/Widgets/Login/ForgotPassword/ResetPasswordSuccessful/ResetPasswordSuccessfulView.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPasswordController {
  TextEditingController emailController = new TextEditingController();
  Widget submitBtn = Text(
    "Submit",
    style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: Stem.regular),
  );

  Future<void> resetPassword(String emailAddress, BuildContext context) async {
    String rawPassword = Generator.generatePassword(PasswordStrength.normal);
    String password = Encrypt().encryptPassword(rawPassword);

    var body = {"emailAddress": emailAddress, "rawPassword": rawPassword, "password": password};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.forgotPassword), body);

    if (response.success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResetPasswordSuccessfulView(),
        ),
      );
    } else {
      Alert(
        context: context,
        style: Common.errorAlertStyle,
        type: AlertType.error,
        title: "Reset password failed!",
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
    }
  }
}

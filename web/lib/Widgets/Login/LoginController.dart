import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Encryptor.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Model/UserModel.dart';

class LoginController {
  Widget obscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool obscureTextCheck = true;

  Widget loginBtnWidget = Text(
    "Log in",
    style: Common.buttonTextStyle,
  );

  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  //Login method
  Future<void> logIn(String emailAddress, String password, BuildContext context) async {
    password = Encrypt().encryptPassword(password); //encrypt password

    emailAddress = emailAddress.toLowerCase();

    var body = {"emailAddress": emailAddress, "password": password};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.login), body);

    if (response.success) {
      UserModel data = UserModel().fromJson(response.data);
      if (data.firstTimeUser) {
        Common.signUpPreData = data;
        Navigator.pushNamed(context, '/SignUp');
      } else {
        Navigator.pushNamed(context, '/Homepage');
      }
    } else if (!response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Login failed",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

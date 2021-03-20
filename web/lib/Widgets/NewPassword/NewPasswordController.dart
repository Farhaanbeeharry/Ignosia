import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Encryptor.dart';
import 'package:web/Model/ResponseModel.dart';

class NewPasswordController {
  final newPasswordFormKey = GlobalKey<FormState>();

  TextEditingController resetKeyController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  Widget passwordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool passwordObscureTextCheck = true;
  Widget confirmPasswordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool confirmPasswordObscureTextCheck = true;

  Color btnColorDefault = Color(0XFF6C63FF);
  Color btnColorResent = Color(0XFF4BB543);

  Widget savePwdBtnWidget = Text(
    "Change password",
    style: Common.buttonTextStyle,
  );
  Widget resentKeyBtnWidget = Text(
    "Resend key",
    style: Common.buttonTextStyle,
  );

  Future<void> changePassword(String key, String password, BuildContext context) async {
    password = Encrypt().encryptPassword(password);

    var body = {"emailAddress": Common.resetEmailAddress, "password": password, "resetKey": key};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.resetPassword), body);

    if (response.success) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          title: "Password reset successful!",
          width: MediaQuery.of(context).size.width * 0.4,
          dismissOnTouchOutside: true,
          desc: "Log in to your account with your new password",
          btnOkOnPress: () {
            Navigator.pushNamed(context, '/Login');
          },
          onDissmissCallback: () {
            Navigator.pushNamed(context, '/Login');
          }).show();
    } else if (!response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Reset password failed!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }

  Future<void> requestKey(String emailAddress, BuildContext context) async {
    emailAddress = emailAddress.toLowerCase();

    var body = {"emailAddress": emailAddress};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.forgotPassword), body);

    if (response.success) {
      Common.resetEmailAddress = emailAddress;
    } else if (!response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Reset password failed!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

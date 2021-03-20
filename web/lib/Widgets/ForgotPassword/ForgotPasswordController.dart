import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/ResponseModel.dart';

class ForgotPasswordController {
  final forgotPasswordKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  Widget requestBtnWidget = Text(
    "Request reset password",
    style: Common.buttonTextStyle,
  );

  Future<void> requestKey(String emailAddress, BuildContext context) async {
    emailAddress = emailAddress.toLowerCase();

    var body = {"emailAddress": emailAddress};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.forgotPassword), body);

    if (response.success) {
      Common.resetEmailAddress = emailAddress;
      Navigator.pushNamed(context, '/NewPassword');
    } else if (!response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: "Reset password failed!",
        width: MediaQuery.of(context).size.width * 0.4,
        btnOkColor: Color(0xFFd93e47),
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

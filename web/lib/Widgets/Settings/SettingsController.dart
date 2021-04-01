import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';

class SettingsController {
  final bugKey = GlobalKey<FormState>();
  final userSettingsKey = GlobalKey<FormState>();

  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  Widget passwordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool passwordObscureTextCheck = true;
  Widget confirmPasswordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool confirmPasswordObscureTextCheck = true;

  Widget bugBtnWidget = Text(
    "Report bug",
    style: Common.buttonTextStyle,
  );
  Widget saveSettingsBtnWidget = Text(
    "Save settings",
    style: Common.buttonTextStyle,
  );
}

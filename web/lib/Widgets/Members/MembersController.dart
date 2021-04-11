import 'package:flutter/material.dart';
import 'package:web/Common/Common.dart';

class MembersController {
  final createMemberKey = GlobalKey<FormState>();

  bool agreementBox = false;
  Color agreementColor = Colors.black;
  Color errorAgreement = Colors.red;

  Widget createMemberBtnWidget = Text(
    "Create member",
    style: Common.buttonTextStyle,
  );
}

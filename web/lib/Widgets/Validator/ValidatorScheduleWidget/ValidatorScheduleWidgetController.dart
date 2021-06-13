import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';

class ValidatorScheduleController {
  Widget btnIcon = Icon(
    FontAwesomeIcons.angleDoubleRight,
    size: 42.0,
    color: Colors.white,
  );

  Future<void> getBeneficiaries(String scheduleID, Function callValidatorSetState) async {
    Beneficiaries.getFromSchedules(scheduleID, callValidatorSetState);
  }
}

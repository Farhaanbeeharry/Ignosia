import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Validator/ValidatorScheduleWidget/ValidatorScheduleWidgetController.dart';

class BeneficiaryValidatorController {
  Widget validateBtn = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        FontAwesomeIcons.checkCircle,
        size: 26.0,
        color: Colors.white,
      ),
      SizedBox(
        width: 7.5,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 6.0, right: 2.0),
        child: Text(
          "Validate",
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.medium),
        ),
      ),
    ],
  );
  Widget rejectBtn = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        FontAwesomeIcons.timesCircle,
        size: 26.0,
        color: Colors.white,
      ),
      SizedBox(
        width: 7.5,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 6.0, right: 2.0),
        child: Text(
          "Reject",
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.medium),
        ),
      ),
    ],
  );

  Future<void> validateBeneficiary(String beneficiaryID, Function callSetState, BuildContext secondaryContext, Function callValidatorSetState) async {
    await alterBeneficiary(beneficiaryID, "true", "false", callSetState, secondaryContext, callValidatorSetState);
  }

  Future<void> rejectBeneficiary(String beneficiaryID, Function callSetState, BuildContext secondaryContext, Function callValidatorSetState) async {
    await alterBeneficiary(beneficiaryID, "false", "true", callSetState, secondaryContext, callValidatorSetState);
  }

  Future<void> alterBeneficiary(String beneficiaryID, String validated, String rejected, Function callSetState, BuildContext secondaryContext, Function callValidatorSetState) async {
    String scheduleID = "";
    var body = {"id": beneficiaryID, "validated": validated, "rejected": rejected};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.alterBeneficiary), body);
    if (response.success) {
      int value;
      for (int i = 0; i < Common.validatorBeneficiaryList.length; i++) {
        if (Common.validatorBeneficiaryList[i].iD == beneficiaryID) {
          value = i;
          break;
        }
      }
      scheduleID = Common.validatorBeneficiaryList[value].scheduleID;
      await callValidatorSetState();
      Common.validatorBeneficiaryList.removeAt(value);
      Common.validatorBeneficiaryWidgetList.removeAt(value);
      if (Common.validatorBeneficiaryWidgetList.isEmpty) {
        Common.validatorBeneficiaryWidgetList.add(Container(
          height: 450.0,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/complete.svg",
                width: 200.0,
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "All beneficiaries checked...",
                style: TextStyle(color: Color(0xFF6c63ff), fontSize: 30.0, fontFamily: Stem.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Do you want to mark schedule as completed?",
                style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: Stem.regular),
              ),
              SizedBox(
                height: 15.0,
              ),
              YesButton(
                id: scheduleID,
                callValidatorSetState: callValidatorSetState,
                secondaryContext: secondaryContext,
              ),
            ],
          ),
        ));
      }
      callSetState();
      AwesomeDialog(
        context: secondaryContext,
        dialogType: validated == "true" ? DialogType.SUCCES : DialogType.WARNING,
        title: validated == "true" ? "Beneficiary validated!" : "Beneficiary rejected!",
        width: MediaQuery.of(secondaryContext).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "Beneficiary with id $beneficiaryID has been altered!",
        btnOkOnPress: () {
          AwesomeDialog().dissmiss();
        },
      ).show();
    } else {
      AwesomeDialog(
        context: secondaryContext,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to alter beneficiary event!",
        width: MediaQuery.of(secondaryContext).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {
          AwesomeDialog().dissmiss();
        },
      ).show();
    }
  }
}

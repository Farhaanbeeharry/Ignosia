import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';

class BeneficiaryDetailedController {
  Widget sendEmailBtnWidget = Text(
    "Send email",
    style: Common.buttonTextStyle,
  );

  Widget deleteBtnWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        FontAwesomeIcons.trashAlt,
        size: 26.0,
        color: Colors.white,
      ),
      SizedBox(
        width: 7.5,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 6.0, right: 2.0),
        child: Text(
          "Delete",
          style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.medium),
        ),
      ),
    ],
  );

  Future<void> deleteBeneficiary(String id, Function callSetState, BuildContext context, Function loadData) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteBeneficiary), body);
    if (response.success) {
      Common.selectedBeneficiaryName = "";
      Common.selectedBeneficiary = false;
      loadData();
      callSetState();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Beneficiary deleted!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "Beneficiary with ID '$id' has been deleted successfully!",
        btnOkOnPress: () {
          AwesomeDialog().dissmiss();
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to delete beneficiary!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {
          AwesomeDialog().dissmiss();
        },
      ).show();
    }
  }
}

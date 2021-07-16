import 'package:flutter/material.dart';
import 'package:ignosia/Common/API.dart';
import 'package:ignosia/Common/ApiUrl.dart';
import 'package:ignosia/Common/Common.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Model/ResponseModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MarkAsDoneController {
  bool agreementChecked = false;
  Widget submitBtnWidget = Text(
    'Submit',
    style: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontFamily: Stem.medium,
    ),
  );
  Future<void> setAsDone(String id, Function loadData, BuildContext context) async {
    var body = {"scheduleID": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.setScheduleDone), body);

    if (response.success) {
      await loadData();
      Navigator.pop(context);
    } else {
      Alert(
        context: context,
        style: Common.errorAlertStyle,
        type: AlertType.error,
        title: "Error!",
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

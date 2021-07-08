import 'package:flutter/material.dart';
import 'package:mobile/Common/API.dart';
import 'package:mobile/Common/ApiUrl.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/ResponseModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ScheduleWidgetController {
  Widget doneBtnWidget = Text(
    'Done',
    style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: Stem.regular),
  );

  Future<void> setScheduleDone(String id, Function callSetState, BuildContext context, Function loadData) async {
    var body = {"scheduleID": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.setScheduleDone), body);

    if (response.success) {
      await loadData();
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

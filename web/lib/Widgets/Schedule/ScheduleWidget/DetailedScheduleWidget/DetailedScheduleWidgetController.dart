import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Model/ResponseModel.dart';

class DetailedScheduleWidgetController {
  Future<void> deleteSchedule(String id, BuildContext context, Function refreshScheduleList) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteSchedule), body);
    if (response.success) {
      await refreshScheduleList();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Schedule deleted!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "Schedule with ID '$id' has been deleted successfully!",
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to delete schedule!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

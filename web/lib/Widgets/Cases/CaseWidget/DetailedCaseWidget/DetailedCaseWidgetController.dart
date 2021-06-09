import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/ResponseModel.dart';

class DetailedCaseController {
  Future<void> deleteCase(String id, BuildContext context, Function refresh, Function refreshCaseList) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteCase), body);
    if (response.success) {
      int value;
      for (int i = 0; i < Common.caseList.length; i++) {
        if (Common.caseList[i].iD == id) {
          value = i;
          break;
        }
      }

      Common.caseList.removeAt(value);
      Common.caseWidgetList.removeAt(value);
      refresh();
      refreshCaseList();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Case deleted!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "Case with ID '$id' has been deleted successfully!",
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to delete case!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

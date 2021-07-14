import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Model/ResponseModel.dart';

class DetailedBugController {
  Future<void> solveBug(String id, BuildContext context, Function loadData, Function callSetState) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.solveBug), body);

    if (response.success) {
      await loadData();
      callSetState();
      Navigator.pop(context);
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to mark as solved!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

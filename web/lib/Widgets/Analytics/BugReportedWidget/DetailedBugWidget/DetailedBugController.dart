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
    }
  }
}

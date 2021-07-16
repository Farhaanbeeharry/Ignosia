import 'package:flutter/cupertino.dart';
import 'package:ignosia/Common/API.dart';
import 'package:ignosia/Common/ApiUrl.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Model/ResponseModel.dart';

class ProfileController {
  Widget logOutBtn = Text(
    'Log out',
    style: TextStyle(fontSize: 18.0, fontFamily: Stem.regular),
  );
  Future<void> logOut(String id) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.logout), body);
  }
}

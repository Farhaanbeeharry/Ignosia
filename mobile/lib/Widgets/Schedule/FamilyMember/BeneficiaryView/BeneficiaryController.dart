import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/API.dart';
import 'package:mobile/Common/ApiUrl.dart';
import 'package:mobile/Model/ResponseModel.dart';

class BeneficiaryController {
  Widget deleteBtnWidget = Icon(
    FontAwesomeIcons.solidTrashAlt,
    color: Colors.white,
  );

  Widget chevronDown = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );
  Widget chevronUp = Icon(
    FontAwesomeIcons.chevronUp,
    color: Colors.white,
  );

  double defaultHeight = 90.0;

  bool basicDetailsVisibility = false;
  double basicDetailsHeight = 90.0;
  double basicDetailsMaxHeight = 430.0;
  Widget basicDetailsBtn = Icon(
    FontAwesomeIcons.chevronDown,
    color: Colors.white,
  );

  bool maleChecked = true;
  bool femaleChecked = false;
  bool otherGenderChecked = false;
  String selectedGender = "Male";
  Color selectedGenderBGColor = Color(0xffff6366);
  Color selectedGenderTextColor = Colors.white;
  Color unselectedGenderBGColor = Color(0xffccfff4);
  Color unselectedGenderTextColor = Colors.grey.shade400;
  Color maleBGColor = Color(0xffff6366);
  Color maleTextColor = Colors.white;
  Color femaleBGColor = Color(0xffccfff4);
  Color femaleTextColor = Colors.grey.shade400;
  Color otherGenderBGColor = Color(0xffccfff4);
  Color otherGenderTextColor = Colors.grey.shade400;

  Future<bool> deleteBeneficiary(String id, Function loadData) async {
    var body = {"beneficiaryID": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteBeneficiary), body);

    if (response.success) {
      return true;
    } else {
      return false;
    }
  }
}

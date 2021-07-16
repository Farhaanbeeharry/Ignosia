import 'package:mobile/Common/API.dart';
import 'package:mobile/Common/ApiUrl.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/BeneficiaryModel.dart';
import 'package:mobile/Model/ResponseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

import 'BeneficiaryWidget/BeneficiaryWidget.dart';

class FamilyMemberController {
  bool listLoaded = false;

  Widget FABWidget = Icon(
    FontAwesomeIcons.plus,
    size: 28.0,
  );

  List<Widget> familyMemberList = new List<Widget>();
  Widget loadingWidget = SpinKitWave(
    color: Colors.white,
    size: 24.0,
  );

  Future<void> getFamilyMembers(String id, Function callSetState, BuildContext context, Function loadData) async {
    listLoaded = false;
    callSetState();

    var body = {"scheduleID": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getFamilyMembers), body);

    if (response.success) {
      familyMemberList.clear();

      List<BeneficiaryModel> familyMembers = new List<BeneficiaryModel>();

      for (int i = 0; i < response.data.length; i++) {
        BeneficiaryModel familyMember = BeneficiaryModel().fromJson(response.data[i]);
        familyMembers.add(familyMember);
      }

      if (familyMembers.length == 0) {
        familyMemberList.add(
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/emptyMobile.svg",
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  Text(
                    "No family member found!",
                    style: TextStyle(fontSize: 24.0, fontFamily: Stem.regular),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        for (var familyMember in familyMembers) {
          familyMemberList.add(BeneficiaryWidget(beneficiary: familyMember, mainSetState: callSetState, loadData: loadData));
        }
      }

      listLoaded = true;
      callSetState();
    } else {
      familyMemberList.add(
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/error.svg",
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  "Failed to load data!",
                  style: TextStyle(fontSize: 24.0, fontFamily: Stem.regular),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  Future<void> addFamilyMember(String scheduleID, Function callSetState, Function loadData, BuildContext context) async {
    listLoaded = false;
    callSetState();

    var uuid = Uuid();
    String id = uuid.v1();

    var body = {"beneficiaryID": id, "scheduleID": scheduleID};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.addFamilyMember), body);

    if (response.success) {
      listLoaded = true;
      await loadData();
      callSetState();
    } else {
      listLoaded = false;
      callSetState();
      Alert(
        context: context,
        style: Common.errorAlertStyle,
        type: AlertType.error,
        title: "Add member failed",
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
      listLoaded = false;
      callSetState();
    }
  }
}

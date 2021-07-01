import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/CaseModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Cases/CaseWidget/CaseWidget.dart';

class CaseController {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController notesController = new TextEditingController();
  TextEditingController searchController = new TextEditingController();

  final createCaseKey = GlobalKey<FormState>();

  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  Widget createCaseBtn = Text(
    'Create case',
    style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: Stem.regular),
  );

  Future<bool> createCase(String name, String phoneNumber, String location, String notes, BuildContext context, Function callSetState) async {
    var uuid = Uuid();
    String id = uuid.v1();

    var body = {"id": id, "createdByUserID": Common.loggedInData.iD, "dateCreated": DateTime.now().toString(), "name": name, "phoneNumber": phoneNumber, "location": location, "latitude": "0", "longitude": "0", "notes": notes};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.createCase), body);

    if (response.success) {
      callSetState();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "New case created!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "A case with name $name has been saved!",
        btnOkOnPress: () {},
      ).show();
      return true;
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to create case!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
      return false;
    }
  }

  Future<void> getCaseList(Function callSetState, Function loadData) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getCaseList), {});

    bool emptyListCheck = true;

    for (var datum in response.data) {
      CaseModel caseData = CaseModel().fromJson(datum);
      if (caseData.deleted == 'false' && caseData.scheduled == 'false') emptyListCheck = false;
    }

    if (response.success) {
      Common.caseWidgetList.clear();
      if (emptyListCheck) {
        Common.caseWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No case found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
      } else {
        Common.caseList.clear();

        for (int i = 0; i < response.data.length; i++) {
          CaseModel caseData = CaseModel().fromJson(response.data[i]);
          if (caseData.deleted == 'false') Common.caseList.add(caseData);
        }

        CaseModel tempCase;

        for (int i = 1; i < Common.caseList.length; i++) {
          for (int j = i; j > 0; j--) {
            if (Common.compareDateFromDateFormat(Common.caseList[j].dateReceived, Common.caseList[j - 1].dateReceived) == -1) {
              tempCase = Common.caseList[j];
              Common.caseList[j] = Common.caseList[j - 1];
              Common.caseList[j - 1] = tempCase;
            }
          }
        }

        for (var caseData in Common.caseList) {
          if (caseData.deleted == "false" && caseData.scheduled == "false") {
            Common.caseWidgetList.add(CaseWidget(data: caseData, getCaseList: loadData));
          }
        }
      }
    } else {
      Common.caseWidgetList.clear();
      Common.caseWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch case list! Click \'Refresh\' to try again.',
            style: TextStyle(
              fontFamily: Stem.light,
              color: Colors.red,
              fontSize: 15.0,
            ),
          ),
        ],
      ));
    }
  }

  displayResult(String value, Function callSetState) {
    Common.caseWidgetList.clear();

    for (var datum in Common.caseList) {
      if ((datum.name.toLowerCase().contains(value.toLowerCase()) || datum.location.toLowerCase().contains(value.toLowerCase()) || datum.phoneNumber.toLowerCase().contains(value.toLowerCase())) && datum.scheduled == 'false') {
        Common.caseWidgetList.add(CaseWidget(data: datum, getCaseList: callSetState));
      }
    }
    if (Common.caseWidgetList.isEmpty) {
      Common.caseWidgetList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No case found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      );
    }
    callSetState();
  }
}

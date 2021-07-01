import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/CaseModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Model/ScheduleModel.dart';
import 'package:web/Model/UserModel.dart';
import 'package:web/Widgets/Schedule/CaseScheduleWidget/CaseScheduleWidget.dart';
import 'package:web/Widgets/Schedule/ScheduleWidget/ScheduleWidget.dart';

class ScheduleController {
  bool isTimeSelected = false;
  DateTime dateToday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  String selectedDate = 'Choose date';

  String initialTime = 'Choose time';
  String displayTime;
  TimeOfDay selectedTime = TimeOfDay.now().replacing(minute: 30);

  String selectedMember;
  TextEditingController searchController = new TextEditingController();

  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );
  Widget caseRefreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  Future<void> getMembersList() async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getMobileUsersList), {});

    if (response.success) {
      SetSchedule.stringMobileUsers.clear();
      SetSchedule.mobileUsers.clear();
      for (int i = 0; i < response.data.length; i++) {
        UserModel member = UserModel().fromJson(response.data[i]);
        SetSchedule.mobileUsers.add(member);
      }

      for (var member in SetSchedule.mobileUsers) {
        SetSchedule.stringMobileUsers.add(member.firstName + " " + member.lastName);
      }
    } else {
      SetSchedule.mobileUsers = [];
      SetSchedule.stringMobileUsers = [];
    }
  }

  Future<void> getScheduleList(Function callSetState, Function loadScheduleData) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getScheduleList), {});

    bool emptyListCheck = true;

    for (var datum in response.data) {
      ScheduleModel scheduleData = ScheduleModel().fromJson(datum);
      if (scheduleData.deleted == 'false') emptyListCheck = false;
    }

    if (response.success) {
      Common.scheduleWidgetList.clear();
      Common.scheduleList.clear();
      if (emptyListCheck) {
        Common.scheduleWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No schedule found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
      } else {
        Common.scheduleList.clear();

        for (int i = 0; i < response.data.length; i++) {
          ScheduleModel scheduleData = ScheduleModel().fromJson(response.data[i]);
          if (scheduleData.deleted == 'false') Common.scheduleList.add(scheduleData);
        }

        ScheduleModel tempCase;

        for (int i = 1; i < Common.scheduleList.length; i++) {
          for (int j = i; j > 0; j--) {
            if (Common.compareDate(Common.scheduleList[j].date + Common.scheduleList[j].time, Common.scheduleList[j - 1].date + Common.scheduleList[j - 1].time) == -1) {
              tempCase = Common.scheduleList[j];
              Common.scheduleList[j] = Common.scheduleList[j - 1];
              Common.scheduleList[j - 1] = tempCase;
            }
          }
        }

        for (var scheduleData in Common.scheduleList) {
          if (scheduleData.deleted == "false") {
            Common.scheduleWidgetList.add(ScheduleWidget(data: scheduleData, callSetState: callSetState, loadScheduleData: loadScheduleData));
          }
        }
      }
    } else {
      Common.scheduleWidgetList.clear();
      Common.scheduleWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch schedule list! Click \'Refresh\' to try again.',
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

  Future<void> getScheduleCaseList(Function callSetState, BuildContext context, Function loadScheduleCaseData, Function clearInputs) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getCaseList), {});

    bool emptyListCheck = true;

    for (var datum in response.data) {
      CaseModel caseData = CaseModel().fromJson(datum);
      if (caseData.deleted == 'false' && caseData.scheduled == 'false') emptyListCheck = false;
    }

    if (response.success) {
      Common.scheduleCaseWidgetList.clear();
      if (emptyListCheck) {
        Common.scheduleCaseWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 25.0),
              child: Text(
                'No case found!',
                style: TextStyle(
                  fontFamily: Stem.light,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ));
      } else {
        Common.scheduleCaseList.clear();

        for (int i = 0; i < response.data.length; i++) {
          CaseModel caseData = CaseModel().fromJson(response.data[i]);
          if (caseData.deleted == 'false') Common.scheduleCaseList.add(caseData);
        }

        CaseModel tempCase;

        for (int i = 1; i < Common.scheduleCaseList.length; i++) {
          for (int j = i; j > 0; j--) {
            if (Common.compareDateFromDateFormat(Common.scheduleCaseList[j].dateReceived, Common.scheduleCaseList[j - 1].dateReceived) == -1) {
              tempCase = Common.scheduleCaseList[j];
              Common.scheduleCaseList[j] = Common.scheduleCaseList[j - 1];
              Common.scheduleCaseList[j - 1] = tempCase;
            }
          }
        }

        for (var caseData in Common.scheduleCaseList) {
          if (caseData.deleted == "false") {
            if (caseData.scheduled == "false") {
              Common.scheduleCaseWidgetList.add(CaseScheduleWidget(data: caseData, context: context, refreshData: loadScheduleCaseData, clearInputs: clearInputs));
            }
          }
        }
      }
    } else {
      Common.scheduleCaseWidgetList.clear();
      Common.scheduleCaseWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch schedule list! Click \'Refresh\' to try again.',
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

  displayResult(String value, Function callSetState, Function loadData) {
    Common.scheduleWidgetList.clear();

    for (var datum in Common.scheduleList) {
      if (datum.name.toLowerCase().contains(value.toLowerCase()) || datum.assignedToLastName.toLowerCase().contains(value.toLowerCase()) || datum.assignedToFirstName.toLowerCase().contains(value.toLowerCase()) || datum.time.toLowerCase().contains(value.toLowerCase()) || datum.date.toLowerCase().contains(value.toLowerCase())) {
        Common.scheduleWidgetList.add(ScheduleWidget(
          data: datum,
          loadScheduleData: loadData,
          callSetState: callSetState,
        ));
      }
    }
    if (Common.scheduleWidgetList.isEmpty) {
      Common.scheduleWidgetList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No schedule found!',
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

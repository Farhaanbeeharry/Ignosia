import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/CaseModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Model/ScheduleModel.dart';

class CaseScheduleController {
  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.save,
    size: 36.0,
    color: Colors.white,
  );
  Future<void> addSchedule(CaseModel data, BuildContext context, Function refreshData, Function clearInputs) async {
    var uuid = Uuid();
    String id = uuid.v1();

    var body = {
      "id": id,
      "createdByUserId": Common.loggedInData.iD,
      "assignedUserId": SetSchedule.selectedUserID,
      "caseID": data.iD,
      "scheduleName": data.name,
      "location": data.location,
      "date": SetSchedule.selectedDate,
      "time": SetSchedule.selectedTime,
      "name": data.name,
      "phoneNumber": data.phoneNumber,
      "notes": data.notes,
    };

    if (checkFreeMember(SetSchedule.selectedUserID)) {
      ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.addSchedule), body);

      if (response.success) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          title: "Schedule created successfully!",
          width: MediaQuery.of(context).size.width * 0.4,
          dismissOnTouchOutside: true,
          desc: "A schedule has been successfully created!",
          btnOkOnPress: () {
            clearInputs();
            refreshData();
          },
          onDissmissCallback: () {
            clearInputs();
            refreshData();
          },
        ).show();
        return true;
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          btnOkColor: Color(0xFFd93e47),
          title: "Failed to create schedule!",
          width: MediaQuery.of(context).size.width * 0.4,
          dismissOnTouchOutside: true,
          desc: response.error,
          btnOkOnPress: () {},
        ).show();
        return false;
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Member not available!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "Member is not free on the selected time and date!",
        btnOkOnPress: () {},
      ).show();
    }

    await Future.delayed(Duration(seconds: 2));
  }

  bool checkFreeMember(String id) {
    List<ScheduleModel> schedules = Common.scheduleList;
    bool check = true;
    for (var schedule in schedules) {
      if (schedule.assignedUserID == id) {
        if (schedule.date == SetSchedule.selectedDate) {
          int scheduleHour = int.parse(schedule.time[0] + schedule.time[1]);
          int selectedHour = int.parse(SetSchedule.selectedTime[0] + SetSchedule.selectedTime[1]);
          if (selectedHour - scheduleHour > -4 && selectedHour - scheduleHour < 4) {
            check = false;
            break;
          }
        }
      }
    }
    return check;
  }
}

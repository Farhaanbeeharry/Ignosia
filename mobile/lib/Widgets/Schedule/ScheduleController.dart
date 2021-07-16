import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ignosia/Common/API.dart';
import 'package:ignosia/Common/ApiUrl.dart';
import 'package:ignosia/Common/Common.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Model/ResponseModel.dart';
import 'package:ignosia/Model/ScheduleModel.dart';
import 'package:ignosia/Widgets/Schedule/ScheduleWidget/ScheduleWidget.dart';

class ScheduleController {
  bool listLoaded = false;

  List<Widget> scheduleWidgetList = new List<Widget>();

  Future<void> getSchedules(BuildContext context, Function callSetState, Function loadData) async {
    listLoaded = false;
    callSetState();

    var body = {"userID": Common.loggedInUserData.iD};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getScheduleForUser), body);

    if (response.success) {
      scheduleWidgetList.clear();

      List<ScheduleModel> schedules = new List<ScheduleModel>();

      for (int i = 0; i < response.data.length; i++) {
        ScheduleModel schedule = ScheduleModel().fromJson(response.data[i]);
        schedules.add(schedule);
      }

      if (schedules.length == 0) {
        scheduleWidgetList.add(
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/empty.svg",
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  Text(
                    "No schedule found!",
                    style: TextStyle(fontSize: 24.0, fontFamily: Stem.regular),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        ScheduleModel tempTransaction;

        for (int i = 1; i < schedules.length; i++) {
          for (int j = i; j > 0; j--) {
            if (Common.compareDate(schedules[j].date + schedules[j].time, schedules[j - 1].date + schedules[j - 1].time) == -1) {
              tempTransaction = schedules[j];
              schedules[j] = schedules[j - 1];
              schedules[j - 1] = tempTransaction;
            }
          }
        }

        for (var schedule in schedules) {
          scheduleWidgetList.add(ScheduleWidget(schedule: schedule, mainSetState: callSetState, loadData: loadData));
        }
      }

      if (schedules.isEmpty)
        Common.nextScheduleDate = "No schedules!";
      else
        Common.setNextVisit(schedules[0].date);

      listLoaded = true;
      callSetState();
    } else {
      scheduleWidgetList.add(
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
}

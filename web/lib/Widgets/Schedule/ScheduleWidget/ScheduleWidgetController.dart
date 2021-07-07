import 'package:flutter/material.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/ScheduleModel.dart';
import 'package:web/Widgets/Schedule/ScheduleWidget/DetailedScheduleWidget/DetailedScheduleWidget.dart';

class ScheduleWidgetController {
  openDetails(ScheduleModel data, BuildContext context, Function loadScheduleData) {
    String displayDate = Common.convertNormalDate(data.date);
    if (data.createdByFirstName == null || data.createdByLastName == null) {
      data.createdByFirstName = "Account";
      data.createdByLastName = "Deleted!";
    }
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return DetailedScheduleWidget(data: data, displayDate: displayDate, refresh: loadScheduleData);
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/EventModel.dart';
import 'package:web/Widgets/Event/EventWidget/DetailedEventWidget/DetailedEventWidget.dart';

class EventWidgetController {
  viewEvent(EventModel data, Function getEventList, BuildContext context) {
    String month = data.date[3] + data.date[4];
    int monthIndex = int.parse(month) - 1;

    String displayDate = data.date[0] + data.date[1] + " " + Common.months[monthIndex] + " " + data.date[6] + data.date[7] + data.date[8] + data.date[9];

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return DetailedEventWidget(data: data, getEventList: getEventList, displayDate: displayDate);
      },
    );
  }
}

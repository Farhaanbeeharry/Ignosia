import 'package:flutter/material.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/CaseModel.dart';
import 'package:web/Widgets/Cases/CaseWidget/DetailedCaseWidget/DetailedCaseWidget.dart';

class CaseWidgetController {
  openDetails(CaseModel data, BuildContext context, Function refreshCaseList, Function callSetState) {
    String displayDate = Common.convertDate(data.dateReceived);
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return DetailedCaseWidget(data: data, displayDate: displayDate, refresh: callSetState, refreshCaseList: refreshCaseList);
      },
    );
  }
}

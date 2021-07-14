import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BugModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Analytics/BugReportedWidget/BugReportedWidget.dart';

class AnalyticsController {
  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  Future<void> getData(Function loadData, Function callSetState, BuildContext context) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getBugsReported), {});

    bool emptyListCheck = true;

    if (response.data.length > 0) emptyListCheck = false;

    if (response.success) {
      Common.bugsWidgetList.clear();
      if (emptyListCheck) {
        Common.bugsWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No bug found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
        callSetState();
      } else {
        Common.bugsList.clear();

        for (int i = 0; i < response.data.length; i++) {
          BugModel bug = BugModel().fromJson(response.data[i]);
          Common.bugsList.add(bug);
        }

        BugModel tempBug;

        for (int i = 1; i < Common.bugsList.length; i++) {
          for (int j = i; j > 0; j--) {
            if (Common.compareDate(Common.bugsList[j].date + "00:01", Common.bugsList[j - 1].date + "00:01") == 1) {
              tempBug = Common.bugsList[j];
              Common.bugsList[j] = Common.bugsList[j - 1];
              Common.bugsList[j - 1] = tempBug;
            }
          }
        }

        for (var bug in Common.bugsList) {
          Common.bugsWidgetList.add(BugReportedWidget(data: bug, loadData: loadData, callSetState: callSetState));
        }
        callSetState();
      }
    } else {
      Common.bugsWidgetList.clear();
      Common.bugsWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch bug list! Click \'Refresh\' to try again.',
            style: TextStyle(
              fontFamily: Stem.light,
              color: Colors.red,
              fontSize: 15.0,
            ),
          ),
        ],
      ));
      callSetState();
    }
  }
}

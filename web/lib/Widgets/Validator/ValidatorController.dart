import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Model/ScheduleModel.dart';
import 'package:web/Widgets/Validator/ValidatorScheduleWidget/ValidatorScheduleWidget.dart';

class ValidatorController {
  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  Future<void> loadSchedules(Function callValidatorSetState, BuildContext context, Function callSetState) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getCarriedOutSchedules), {});

    bool emptyListCheck = true;

    for (var datum in response.data) {
      ScheduleModel scheduleData = ScheduleModel().fromJson(datum);
      if (scheduleData.deleted == 'false' && scheduleData.carriedOut == 'true') emptyListCheck = false;
    }

    if (response.success) {
      Common.carriedOutScheduleWidgetList.clear();
      if (emptyListCheck) {
        Common.carriedOutScheduleWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No carried-out schedule found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
      } else {
        Common.carriedOutScheduleList.clear();

        for (int i = 0; i < response.data.length; i++) {
          ScheduleModel scheduleData = ScheduleModel().fromJson(response.data[i]);
          if (scheduleData.deleted == 'false' && scheduleData.carriedOut == 'true') Common.carriedOutScheduleList.add(scheduleData);
        }

        // ScheduleModel tempCase;
        //
        // for (int i = 1; i < Common.carriedOutScheduleList.length; i++) {
        //   for (int j = i; j > 0; j--) {
        //     if (Common.compareDateFromDateFormat(Common.carriedOutScheduleList[j].dateReceived, Common.carriedOutScheduleList[j - 1].dateReceived) == -1) {
        //       tempCase = Common.carriedOutScheduleList[j];
        //       Common.carriedOutScheduleList[j] = Common.carriedOutScheduleList[j - 1];
        //       Common.carriedOutScheduleList[j - 1] = tempCase;
        //     }
        //   }
        // }

        for (var scheduleData in Common.carriedOutScheduleList) {
          if (scheduleData.deleted == "false" && scheduleData.carriedOut == "true") {
            Common.carriedOutScheduleWidgetList.add(ValidatorScheduleWidget(data: scheduleData, secondaryContext: context, callValidatorSetState: callValidatorSetState, refresh: callSetState));
          }
        }
      }
    } else {
      Common.carriedOutScheduleWidgetList.clear();
      Common.carriedOutScheduleWidgetList.add(Row(
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
}

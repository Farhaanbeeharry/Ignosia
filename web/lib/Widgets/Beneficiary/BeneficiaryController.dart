import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BeneficiaryModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Beneficiary/BeneficiarySummaryWidget/BeneficiarySummaryWidget.dart';

class BeneficiaryController {
  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  TextEditingController searchController = new TextEditingController();

  Future<void> getBeneficiaryList(Function callSetState, Function loadData, BuildContext context) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getBeneficiaryList), {});

    bool emptyListCheck = true;

    for (var datum in response.data) {
      BeneficiaryModel beneficiaryData = BeneficiaryModel().fromJson(datum);
      if (beneficiaryData.validated == 'true') emptyListCheck = false;
    }

    if (response.success) {
      Common.beneficiaryWidgetList.clear();
      if (emptyListCheck) {
        Common.beneficiaryWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No beneficiary found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
      } else {
        Common.beneficiaryList.clear();

        for (int i = 0; i < response.data.length; i++) {
          BeneficiaryModel beneficiaryData = BeneficiaryModel().fromJson(response.data[i]);
          if (beneficiaryData.validated == 'true') Common.beneficiaryList.add(beneficiaryData);
        }

        for (var beneficiaryData in Common.beneficiaryList) {
          if (beneficiaryData.validated == "true") {
            Common.beneficiaryWidgetList.add(BeneficiarySummaryWidget(data: beneficiaryData, callSetState: callSetState, secondaryContext: context, loadData: loadData));
          }
        }
      }
    } else {
      Common.beneficiaryWidgetList.clear();
      Common.beneficiaryWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch beneficiary list! Click \'Refresh\' to try again.',
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
    Common.beneficiaryWidgetList.clear();

    for (var datum in Common.beneficiaryList) {
      if (datum.firstName.toLowerCase().contains(value.toLowerCase()) || datum.lastName.toLowerCase().contains(value.toLowerCase()) || datum.location.toLowerCase().contains(value.toLowerCase()) || datum.mobilePhone.toLowerCase().contains(value.toLowerCase())) {
        Common.beneficiaryWidgetList.add(BeneficiarySummaryWidget(data: datum));
      }
    }
    if (Common.beneficiaryWidgetList.isEmpty) {
      Common.beneficiaryWidgetList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No beneficiary found!',
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

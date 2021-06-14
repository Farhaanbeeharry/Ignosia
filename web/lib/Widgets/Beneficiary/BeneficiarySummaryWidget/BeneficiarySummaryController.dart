import 'package:flutter/material.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BeneficiaryModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Beneficiary/BeneficiaryDetailedWidget/BeneficiaryDetailedWidget.dart';

class BeneficiarySummaryController {
  Future<void> getBeneficiary(String id, Function callSetState, BuildContext context, Function loadData) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getBeneficiary), body);

    if (response.success) {
      BeneficiaryModel beneficiary = BeneficiaryModel().fromJson(response.data);
      Common.beneficiaryWidget = BeneficiaryDetailedWidget(data: beneficiary, callSetState: callSetState, secondaryContext: context, loadData: loadData);
      Common.selectedBeneficiary = true;
      callSetState();
    } else {
      Common.beneficiaryWidget = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch data! Click \'Refresh\' to try again.',
            style: TextStyle(
              fontFamily: Stem.light,
              color: Colors.red,
              fontSize: 15.0,
            ),
          ),
        ],
      );
      Common.selectedBeneficiary = true;
      callSetState();
    }
  }
}

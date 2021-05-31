import 'package:flutter/material.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Widgets/Dashboard/DashboardTransactionWidget/DashboardTransactionWidget.dart';

class DashboardController {
  Widget loadingWidget = Container();

  String memberData = "";
  String caseData = "";
  String beneficiaryData = "";
  String eventData = "";

  Future<bool> getDashboardData(Function callSetState) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getDashboardData), {});

    if (response.success) {
      memberData = response.data[0]['members'].toString();
      caseData = response.data[0]['cases'].toString();
      beneficiaryData = response.data[0]['beneficiaries'].toString();
      eventData = response.data[0]['events'].toString();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getRecentTransactionData(Function callSetState) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getRecentTransactionData), {});

    bool emptyListCheck = true;

    for (var datum in response.data) {
      TransactionModel transaction = TransactionModel().fromJson(datum);
      if (transaction.deleted == "false") emptyListCheck = false;
    }

    if (response.success) {
      Common.recentTransactionWidgetList.clear();
      if (emptyListCheck) {
        Common.recentTransactionWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No transaction found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
      } else {
        Common.recentTransactionList.clear();

        for (int i = 0; i < response.data.length; i++) {
          TransactionModel transaction = TransactionModel().fromJson(response.data[i]);
          if (transaction.deleted == 'false') Common.recentTransactionList.add(transaction);
        }

        TransactionModel tempTransaction;

        for (int i = 1; i < Common.recentTransactionList.length; i++) {
          for (int j = i; j > 0; j--) {
            if (DateTime.parse(Common.recentTransactionList[j].date).compareTo(DateTime.parse(Common.recentTransactionList[j - 1].date)) > 0) {
              tempTransaction = Common.recentTransactionList[j];
              Common.recentTransactionList[j] = Common.recentTransactionList[j - 1];
              Common.recentTransactionList[j - 1] = tempTransaction;
            }
          }
        }

        for (int i = 0; i < (Common.recentTransactionList.length > 4 ? 4 : Common.recentTransactionList.length); i++) {
          if (Common.recentTransactionList[i].deleted == "false") {
            Common.recentTransactionWidgetList.add(DashboardTransactionWidget(data: Common.recentTransactionList[i]));
          }
        }
      }
    } else {
      Common.recentTransactionWidgetList.clear();
      Common.recentTransactionWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch transaction list! Click \'Refresh\' to try again.',
            style: TextStyle(
              fontFamily: Stem.light,
              color: Colors.red,
              fontSize: 15.0,
            ),
          ),
        ],
      ));
    }

    return true;
  }
}

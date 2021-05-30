import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Widgets/Finance/TransactionWidget/TransactionWidget.dart';

class FinanceController {
  Widget balanceWidget = Container();
  Color balanceTextColor = Colors.black;

  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );
  Widget balanceRefreshBtn = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  final newTransactionKey = GlobalKey<FormState>();

  Widget saveTransactionBtn = Text(
    'Save transaction',
    style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: Stem.regular),
  );

  bool incomeBool = true;
  bool expenseBool = false;

  Color disabledCheckBoxContainer = Colors.black12;
  Color disabledCheckBoxText = Colors.grey.shade500;

  Color enabledCheckBoxContainer = Color(0xFF6c63ff);
  Color enabledCheckBoxText = Colors.white;

  bool cashBool = true;
  bool chequeBool = false;
  bool transferBool = false;

  TextEditingController nameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();

  Future<void> getBalance() async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getBalance), {});
    if (response.success) {
      if (response.data['status'] == 'neutral')
        balanceTextColor = Colors.black;
      else if (response.data['status'] == 'profit')
        balanceTextColor = Colors.green;
      else if (response.data['status'] == 'loss') balanceTextColor = Colors.red;

      balanceWidget = Text(
        response.data['status'] == 'loss' ? "-Rs${response.data['balance'].abs().toString()}" : "Rs${response.data['balance']}",
        style: TextStyle(fontSize: 24.0, color: balanceTextColor, fontFamily: Stem.bold),
      );
    } else {
      balanceWidget = Text(
        "Failed to load balance!",
        style: TextStyle(fontSize: 16.0, color: Colors.black26, fontFamily: Stem.medium),
      );
    }
  }

  Future<void> newTransaction(String name, String description, String amount, BuildContext context, Function callSetState) async {
    var uuid = Uuid();
    String id = uuid.v1();

    String date = DateTime.now().toString();

    String type = incomeBool ? "income" : "expense";
    String method = "";

    if (cashBool) {
      method = "cash";
    } else if (chequeBool) {
      method = "cheque";
    } else if (transferBool) {
      method = "transfer";
    }

    var body = {"id": id, "userID": Common.loggedInData.iD, "name": name, "description": description, "amount": amount, "date": date, "type": type, "method": method};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.newTransaction), body);

    if (response.success) {
      callSetState();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "New transaction saved!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "An $type with amount Rs$amount has been saved!",
        btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to save transaction!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }

  Future<void> getTransactionList(Function callSetState, Function loadTransaction, Function getBalance) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getTransactionList), {});
    bool emptyListCheck = true;

    for (var datum in response.data) {
      TransactionModel transaction = TransactionModel().fromJson(datum);
      if (transaction.deleted == "false") emptyListCheck = false;
    }

    if (response.success) {
      Common.transactionWidgetList.clear();
      if (emptyListCheck) {
        Common.transactionWidgetList.add(Row(
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
        Common.transactionList.clear();

        for (int i = 0; i < response.data.length; i++) {
          TransactionModel transaction = TransactionModel().fromJson(response.data[i]);
          if (transaction.deleted == 'false') Common.transactionList.add(transaction);
        }

        TransactionModel tempTransaction;

        for (int i = 1; i < Common.transactionList.length; i++) {
          for (int j = i; j > 0; j--) {
            if (DateTime.parse(Common.transactionList[j].date).compareTo(DateTime.parse(Common.transactionList[j - 1].date)) > 0) {
              tempTransaction = Common.transactionList[j];
              Common.transactionList[j] = Common.transactionList[j - 1];
              Common.transactionList[j - 1] = tempTransaction;
            }
          }
        }

        for (var transaction in Common.transactionList) {
          if (transaction.deleted == "false") {
            Common.transactionWidgetList.add(TransactionWidget(data: transaction, refresh: loadTransaction, refreshBalance: getBalance));
          }
        }
      }
    } else {
      Common.transactionWidgetList.clear();
      Common.transactionWidgetList.add(Row(
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
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';

class FinanceController {
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

  Future<void> newTransaction(String name, String description, String amount, BuildContext context) async {
    var uuid = Uuid();
    String id = uuid.v1();

    String date = Common.getDate();

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
}

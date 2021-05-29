import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/ResponseModel.dart';

class DetailedTransactionController {
  Future<void> deleteTransaction(String id, BuildContext context, Function refreshList) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteTransaction), body);
    if (response.success) {
      int value;
      for (int i = 0; i < Common.transactionList.length; i++) {
        if (Common.transactionList[i].id == id) {
          value = i;
          break;
        }
      }

      Common.transactionList.removeAt(value);
      Common.transactionWidgetList.removeAt(value);
      refreshList();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Transaction deleted!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "Transaction with ID '$id' has been deleted successfully!",
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to delete transaction!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

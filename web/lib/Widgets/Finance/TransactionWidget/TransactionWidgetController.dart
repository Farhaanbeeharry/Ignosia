import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Widgets/Finance/TransactionWidget/DetailedTransactionWidget/DetailedTransactionWidget.dart';

class TransactionWidgetController {
  Color inColor = Colors.green;
  Color outColor = Colors.red;

  Icon getMethodIcon(String method) {
    if (method == "cash") {
      return Icon(FontAwesomeIcons.moneyBill);
    } else if (method == "cheque") {
      return Icon(FontAwesomeIcons.moneyCheck);
    } else
      return Icon(FontAwesomeIcons.mobile);
  }

  openDetails(TransactionModel data, BuildContext context, Function callSetState, Function callWidgetSetState) {
    String displayDate = Common.convertDate(data.date);

    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return DetailedTransactionWidget(
          data: data,
          displayDate: displayDate,
          methodIcon: getMethodIcon(data.method),
          refresh: callSetState,
        );
      },
    );
  }
}

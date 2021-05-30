import 'package:flutter/material.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Widgets/Finance/TransactionWidget/TransactionWidgetController.dart';

class TransactionWidget extends StatefulWidget {
  final TransactionModel data;
  final Function refresh;
  final Function refreshBalance;

  TransactionWidget({this.data, this.refresh, this.refreshBalance});

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  callWidgetSetState() {
    setState(() {});
  }

  TransactionWidgetController transactionWidgetController = new TransactionWidgetController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            transactionWidgetController.openDetails(widget.data, context, widget.refresh, widget.refreshBalance, callWidgetSetState);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFe1e1e1),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            width: 500.0,
            height: 80.0,
            child: Row(
              children: [
                Container(
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: widget.data.type == "income" ? transactionWidgetController.inColor : transactionWidgetController.outColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.type == "income" ? "Income" : "Expense",
                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'StemRegular'),
                    ),
                    Text((widget.data.type == "income" ? "From " : "To ") + widget.data.name, style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: 'StemLight')),
                  ],
                ),
                Spacer(),
                Container(
                  alignment: Alignment.center,
                  width: 125.0,
                  child: Text(
                    'Rs${widget.data.amount}',
                    style: TextStyle(
                      color: widget.data.type == "income" ? transactionWidgetController.inColor : transactionWidgetController.outColor,
                      fontSize: 20.0,
                      fontFamily: 'StemMedium',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

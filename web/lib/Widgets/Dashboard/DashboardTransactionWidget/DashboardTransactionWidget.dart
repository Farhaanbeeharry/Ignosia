import 'package:flutter/material.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Widgets/Dashboard/DashboardTransactionWidget/DashboardTransactionWidgetController.dart';

class DashboardTransactionWidget extends StatefulWidget {
  final TransactionModel data;

  DashboardTransactionWidget({this.data});

  @override
  _DashboardTransactionWidgetState createState() => _DashboardTransactionWidgetState();
}

class _DashboardTransactionWidgetState extends State<DashboardTransactionWidget> {
  DashboardTransactionWidgetController dashboardTransactionWidgetController = new DashboardTransactionWidgetController();
  @override
  Widget build(BuildContext context) {
    if (widget.data.type == "income") {
      dashboardTransactionWidgetController.currentColor = dashboardTransactionWidgetController.inColor;
    } else if (widget.data.type == "expense") {
      dashboardTransactionWidgetController.currentColor = dashboardTransactionWidgetController.outColor;
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: 345.0,
          height: 80.0,
          child: Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (widget.data.type == "income" ? "Income" : "Expense") + " - ${widget.data.date[8] + widget.data.date[9] + "/" + widget.data.date[5] + widget.data.date[6] + "/" + widget.data.date[0] + widget.data.date[1] + widget.data.date[2] + widget.data.date[3]}",
                    style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'StemRegular'),
                  ),
                  Text(
                    (widget.data.type == "income" ? "From " : "To ") + widget.data.name,
                    style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: 'StemLight'),
                  ),
                ],
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                width: 100.0,
                child: Text(
                  'Rs${widget.data.amount}',
                  style: TextStyle(color: dashboardTransactionWidgetController.currentColor, fontSize: 20.0, fontFamily: 'StemMedium'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

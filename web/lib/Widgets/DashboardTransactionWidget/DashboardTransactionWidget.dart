import 'package:flutter/material.dart';
import 'package:web/Widgets/DashboardTransactionWidget/DashboardTransactionWidgetController.dart';

class DashboardTransactionWidget extends StatefulWidget {
  final String title, description, type;
  final double amount;

  DashboardTransactionWidget({this.title, this.description, this.type, this.amount});

  @override
  _DashboardTransactionWidgetState createState() => _DashboardTransactionWidgetState();
}

class _DashboardTransactionWidgetState extends State<DashboardTransactionWidget> {
  DashboardTransactionWidgetController dashboardTransactionWidgetController = new DashboardTransactionWidgetController();
  @override
  Widget build(BuildContext context) {
    if (widget.type == "in") {
      dashboardTransactionWidgetController.currentColor = dashboardTransactionWidgetController.inColor;
    } else if (widget.type == "out") {
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
                    widget.title,
                    style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: 'StemRegular'),
                  ),
                  Text(widget.description, style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: 'StemLight')),
                ],
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                width: 100.0,
                child: Text(
                  'Rs${widget.amount}',
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

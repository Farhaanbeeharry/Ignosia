import 'package:flutter/material.dart';
import 'package:web/Widgets/Finance/TransactionWidget/TransactionWidgetController.dart';

class TransactionWidget extends StatefulWidget {
  final String title, description, type;
  final double amount;

  TransactionWidget({this.title, this.description, this.type, this.amount});

  @override
  _TransactionWidgetState createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  TransactionWidgetController transactionWidgetController = new TransactionWidgetController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                  color: widget.type == "in" ? transactionWidgetController.inColor : transactionWidgetController.outColor,
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
                  style: TextStyle(
                    color: widget.type == "in" ? transactionWidgetController.inColor : transactionWidgetController.outColor,
                    fontSize: 20.0,
                    fontFamily: 'StemMedium',
                  ),
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

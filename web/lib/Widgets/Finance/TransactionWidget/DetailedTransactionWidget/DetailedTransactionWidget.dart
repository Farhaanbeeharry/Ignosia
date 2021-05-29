import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/TransactionModel.dart';
import 'package:web/Widgets/Finance/TransactionWidget/DetailedTransactionWidget/DetailedTransactionController.dart';

class DetailedTransactionWidget extends StatefulWidget {
  final TransactionModel data;
  final String displayDate;
  final Icon methodIcon;
  final Function refresh;

  DetailedTransactionWidget({this.data, this.displayDate, this.methodIcon, this.refresh});

  @override
  _DetailedTransactionWidgetState createState() => _DetailedTransactionWidgetState();
}

class _DetailedTransactionWidgetState extends State<DetailedTransactionWidget> {
  DetailedTransactionController detailedTransactionController = new DetailedTransactionController();

  Widget deleteBtnWidget = Icon(
    FontAwesomeIcons.trash,
    color: Colors.white,
    size: 24.0,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 500.0,
              width: 1200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/transactionDetail.svg",
                    width: 300.0,
                  ),
                  SizedBox(
                    width: 125.0,
                  ),
                  Container(
                    width: 500.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View a transaction',
                          style: TextStyle(fontSize: 54.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Date: ',
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                            ),
                            Text(
                              widget.displayDate,
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                            ),
                            Text(
                              widget.data.name,
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Amount: ',
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                            ),
                            Text(
                              "Rs " + widget.data.amount,
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Description: ',
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                            ),
                            Text(
                              widget.data.description,
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Type: ',
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                            ),
                            Text(
                              Common.capitaliseOnlyFirstLetter(widget.data.type.toString()),
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Padding(
                              padding: widget.data.type == "income" ? const EdgeInsets.only(top: 7.0) : const EdgeInsets.only(bottom: 15.0),
                              child: Icon(
                                widget.data.type == "income" ? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown,
                                color: widget.data.type == "income" ? Colors.green : Colors.red,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'Method: ',
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                            ),
                            Text(
                              Common.capitaliseOnlyFirstLetter(widget.data.method),
                              style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7.0),
                              child: widget.methodIcon,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.0,
                              width: 325.0,
                              child: TextButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                child: Text(
                                  "Close",
                                  style: Common.buttonTextStyle,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              height: 50.0,
                              width: 165.0,
                              child: TextButton(
                                onPressed: () async {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  setState(() {
                                    deleteBtnWidget = SpinKitWave(
                                      color: Colors.white,
                                      size: 25.0,
                                    );
                                  });

                                  await detailedTransactionController.deleteTransaction(widget.data.id, context, widget.refresh);

                                  setState(() {
                                    deleteBtnWidget = Icon(
                                      FontAwesomeIcons.trash,
                                      color: Colors.white,
                                      size: 24.0,
                                    );
                                  });
                                },
                                style: TextButton.styleFrom(backgroundColor: Colors.red, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                child: deleteBtnWidget,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

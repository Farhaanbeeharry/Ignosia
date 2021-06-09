import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/CaseModel.dart';
import 'package:web/Widgets/Cases/CaseWidget/CaseWidgetController.dart';

class CaseWidget extends StatefulWidget {
  final CaseModel data;
  final Function getCaseList;

  CaseWidget({this.data, this.getCaseList});

  @override
  _CaseWidgetState createState() => _CaseWidgetState();
}

class _CaseWidgetState extends State<CaseWidget> {
  CaseWidgetController caseWidgetController = new CaseWidgetController();

  callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    String month = widget.data.dateReceived[5] + widget.data.dateReceived[6];
    int monthIndex = int.parse(month) - 1;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.275,
          height: 120.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: Container(
                  width: 300.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data.name,
                        style: TextStyle(fontSize: 20.0, color: Color(0xFF6c63ff), fontFamily: 'StemMedium'),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Phone: ${widget.data.phoneNumber}',
                        style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: 'StemRegular'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Address: " + widget.data.location,
                        style: TextStyle(fontSize: 12.0, color: Colors.black, fontFamily: 'StemLight'),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "Date created: ${widget.data.dateReceived[8] + widget.data.dateReceived[9] + " " + Common.months[monthIndex] + " " + widget.data.dateReceived[0] + widget.data.dateReceived[1] + widget.data.dateReceived[2] + widget.data.dateReceived[3]}",
                        style: TextStyle(fontSize: 12.0, color: Colors.black, fontFamily: 'StemLight'),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  caseWidgetController.openDetails(widget.data, context, widget.getCaseList, callSetState);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                    color: Color(0xFF6c63ff),
                  ),
                  alignment: Alignment.center,
                  width: 70.0,
                  child: Icon(
                    FontAwesomeIcons.externalLinkAlt,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

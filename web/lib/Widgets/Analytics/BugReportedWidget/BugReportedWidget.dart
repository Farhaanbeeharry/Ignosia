import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BugModel.dart';
import 'package:web/Widgets/Analytics/BugReportedWidget/DetailedBugWidget/DetailedBugWidget.dart';

class BugReportedWidget extends StatefulWidget {
  final BugModel data;
  final Function loadData;
  final Function callSetState;

  BugReportedWidget({this.data, this.loadData, this.callSetState});
  @override
  _BugReportedWidgetState createState() => _BugReportedWidgetState();
}

class _BugReportedWidgetState extends State<BugReportedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            return showDialog<void>(
              context: context,
              barrierDismissible: true, // user must tap button!
              builder: (BuildContext context) {
                return DetailedBugWidget(data: widget.data, loadData: widget.loadData, callSetState: widget.callSetState);
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xffe1e1e1),
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.data.solved == "true"
                      ? Icon(
                          FontAwesomeIcons.solidCheckCircle,
                          size: 36.0,
                          color: Colors.green,
                        )
                      : Icon(
                          FontAwesomeIcons.solidTimesCircle,
                          size: 36.0,
                          color: Colors.red,
                        ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 275.0,
                        child: Text(
                          widget.data.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: Stem.medium),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        Common.convertNormalDate(
                          widget.data.date,
                        ),
                        style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: Stem.light),
                      ),
                    ],
                  )
                ],
              ),
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

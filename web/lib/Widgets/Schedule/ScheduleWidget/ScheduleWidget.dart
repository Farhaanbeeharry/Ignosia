import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ScheduleModel.dart';
import 'package:web/Widgets/Schedule/ScheduleWidget/ScheduleWidgetController.dart';

class ScheduleWidget extends StatefulWidget {
  final ScheduleModel data;
  final Function callSetState;
  final Function loadScheduleData;

  ScheduleWidget({this.data, this.callSetState, this.loadScheduleData});

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  ScheduleWidgetController scheduleWidgetController = new ScheduleWidgetController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.30,
          height: 120.0,
          child: Container(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFe1e1e1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: 341.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.name,
                            style: TextStyle(color: Colors.black, fontSize: 26.0, fontFamily: Stem.bold),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            'Assigned to ' + widget.data.assignedToFirstName + " " + widget.data.assignedToLastName,
                            style: TextStyle(fontSize: 16.0, fontFamily: Stem.regular),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            'at ${widget.data.time} on ${widget.data.date}',
                            style: TextStyle(fontSize: 14.0, fontFamily: Stem.light),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 5.0,
                ),
                InkWell(
                  onTap: () {
                    scheduleWidgetController.openDetails(widget.data, context, widget.loadScheduleData);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF6c63ff),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    width: 70.0,
                    child: Icon(
                      FontAwesomeIcons.externalLinkAlt,
                      size: 32.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ScheduleModel.dart';
import 'package:web/Widgets/Schedule/ScheduleWidget/DetailedScheduleWidget/DetailedScheduleWidgetController.dart';

class DetailedScheduleWidget extends StatefulWidget {
  final ScheduleModel data;
  final String displayDate;
  final Function refresh;

  DetailedScheduleWidget({this.data, this.displayDate, this.refresh});

  @override
  _DetailedScheduleWidgetState createState() => _DetailedScheduleWidgetState();
}

class _DetailedScheduleWidgetState extends State<DetailedScheduleWidget> {
  DetailedScheduleWidgetController detailedScheduleWidgetController = new DetailedScheduleWidgetController();

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
              height: 600.0,
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
                    "assets/images/scheduleDetail.svg",
                    width: 300.0,
                  ),
                  SizedBox(
                    width: 100.0,
                  ),
                  Container(
                    width: 600.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View a schedule',
                          style: TextStyle(fontSize: 54.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 320.0,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Scheduled by: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.createdByFirstName + " " + widget.data.createdByLastName,
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
                                      'Assigned to: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.assignedToFirstName + " " + widget.data.assignedToLastName,
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
                                      'Person name: ',
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
                                      'Location: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.location,
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
                                      'Schedule at ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                    ),
                                    Text(
                                      widget.data.time,
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      ' on ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                    ),
                                    Text(
                                      widget.displayDate,
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Phone number: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.phoneNumber,
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Notes: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Container(
                                      width: 450.0,
                                      child: Text(
                                        widget.data.notes,
                                        style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.0,
                              width: 375.0,
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
                              width: 200.0,
                              child: TextButton(
                                onPressed: () async {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  setState(() {
                                    deleteBtnWidget = SpinKitWave(
                                      color: Colors.white,
                                      size: 25.0,
                                    );
                                  });

                                  await detailedScheduleWidgetController.deleteSchedule(widget.data.iD, context, widget.refresh);

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

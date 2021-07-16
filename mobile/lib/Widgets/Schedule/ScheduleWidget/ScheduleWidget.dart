import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ignosia/Common/Common.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Model/ScheduleModel.dart';
import 'package:ignosia/Widgets/Schedule/FamilyMember/FamilyMemberView.dart';
import 'package:ignosia/Widgets/Schedule/MarkAsDoneView/MarkAsDoneView.dart';
import 'package:ignosia/Widgets/Schedule/ScheduleWidget/ScheduleWidgetController.dart';

class ScheduleWidget extends StatefulWidget {
  final ScheduleModel schedule;
  final Function mainSetState, loadData;

  ScheduleWidget({this.schedule, this.mainSetState, this.loadData});

  @override
  _ScheduleWidgetState createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  ScheduleWidgetController scheduleWidgetController = new ScheduleWidgetController();

  callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.0,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                ),
                height: 130,
                width: MediaQuery.of(context).size.width * 0.65,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.schedule.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: Stem.medium,
                            ),
                          ),
                          Spacer(),
                          Common.checkLateness(widget.schedule.date + widget.schedule.time)
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 2.5),
                                  child: Icon(
                                    FontAwesomeIcons.clock,
                                    size: 20.0,
                                    color: Colors.red,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        widget.schedule.location,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: Stem.regular,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FamilyMemberView(schedule: widget.schedule)),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 75.0,
                              height: 35.0,
                              color: Colors.blue,
                              child: Text(
                                'Open',
                                style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: Stem.regular),
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MarkAsDoneView(schedule: widget.schedule, loadData: widget.loadData)),
                              );

                              // Alert(
                              //   context: context,
                              //   type: AlertType.warning,
                              //   title: "Mark as done",
                              //   desc: "Are you sure you want to mark schedule with name ${widget.schedule.name} as done?",
                              //   buttons: [
                              //     DialogButton(
                              //       child: Text(
                              //         "No",
                              //         style: TextStyle(color: Colors.white, fontSize: 20),
                              //       ),
                              //       onPressed: () => Navigator.pop(context),
                              //       color: Colors.red,
                              //     ),
                              //     DialogButton(
                              //       child: Text(
                              //         "Yes",
                              //         style: TextStyle(color: Colors.white, fontSize: 20),
                              //       ),
                              //       onPressed: () async {
                              //         print(widget.schedule.iD);
                              //         setState(() {
                              //           scheduleWidgetController.doneBtnWidget = SpinKitWave(
                              //             color: Colors.white,
                              //             size: 16.0,
                              //           );
                              //         });
                              //         await scheduleWidgetController.setScheduleDone(widget.schedule.iD, callSetState, context, widget.loadData);
                              //         Navigator.pop(context);
                              //         setState(() {
                              //           scheduleWidgetController.doneBtnWidget = Text(
                              //             'Done',
                              //             style: TextStyle(color: Colors.white, fontSize: 14.0, fontFamily: Stem.regular),
                              //           );
                              //         });
                              //       },
                              //       color: Colors.green,
                              //     )
                              //   ],
                              // ).show();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 75.0,
                              height: 35.0,
                              color: Colors.green,
                              child: scheduleWidgetController.doneBtnWidget,
                            ),
                          ),
                          Spacer(),
                          Text(
                            widget.schedule.time,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: Stem.light,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  gradient: new LinearGradient(
                      colors: [
                        const Color(0xFF00e6d1),
                        const Color(0xFF01877b),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                height: 160.0,
                width: MediaQuery.of(context).size.width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.schedule.date[0] + widget.schedule.date[1],
                      style: TextStyle(color: Colors.white, fontSize: 38.0, fontFamily: Stem.bold),
                    ),
                    Text(
                      Common.getMonth(widget.schedule.date[3] + widget.schedule.date[4]),
                      style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: Stem.light),
                    )
                  ],
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

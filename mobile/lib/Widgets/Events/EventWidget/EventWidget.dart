import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ignosia/Common/Common.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Model/EventModel.dart';
import 'package:ignosia/Widgets/Events/DetailedEventWidget/DetailedEventWidget.dart';

class EventWidget extends StatefulWidget {
  final EventModel event;

  EventWidget({this.event});

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF01877b),
                  const Color(0xFF00b8a7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            // color: Color(0xFFc5d7db),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.eventName,
                        style: TextStyle(fontFamily: Stem.medium, fontSize: 22.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        Common.convertNormalDate(widget.event.date) + " at " + widget.event.time,
                        style: TextStyle(fontFamily: Stem.regular, fontSize: 18.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      builder: (BuildContext context) {
                        return DetailedEventWidget(event: widget.event);
                      },
                    );
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidEye,
                      color: Color(0xff01877b),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/EventModel.dart';
import 'package:web/Widgets/Event/EventWidget/EventWidgetController.dart';

class EventWidget extends StatefulWidget {
  final EventModel data;
  final Function getEventList;

  EventWidget({this.data, this.getEventList});

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  EventWidgetController eventWidgetController = new EventWidgetController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          width: 500.0,
          height: 150.0,
          child: Row(
            children: [
              Container(
                width: 15.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  color: Color(0xFF6c63ff),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                width: 280.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.data.eventName,
                          style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: Stem.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sponsored by ${widget.data.eventSponsor}',
                      style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: Stem.light),
                    ),
                    SizedBox(
                      height: 2.5,
                    ),
                    Text(
                      'Created for ${widget.data.benefittedPeople}',
                      style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: Stem.light),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cost = Rs${widget.data.cost}',
                          style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: Stem.medium),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                  ),
                  color: Color(0xFF6c63ff),
                ),
                width: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      widget.data.date[0] + widget.data.date[1] + widget.data.date[2] + widget.data.date[3] + widget.data.date[4],
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: Stem.regular),
                    ),
                    Text(
                      widget.data.date[6] + widget.data.date[7] + widget.data.date[8] + widget.data.date[9],
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.regular),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      color: Colors.white,
                      height: 1.0,
                      width: 40.0,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      widget.data.time,
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: Stem.regular),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        eventWidgetController.viewEvent(widget.data, widget.getEventList, context);
                      },
                      child: Container(
                        width: 60.0,
                        height: 25.0,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Text(
                            'View',
                            style: TextStyle(
                              fontFamily: Stem.medium,
                              fontSize: 14.0,
                            ),
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              )
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

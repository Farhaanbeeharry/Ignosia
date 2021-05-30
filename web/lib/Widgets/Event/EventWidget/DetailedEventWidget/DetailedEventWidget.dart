import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/EventModel.dart';
import 'package:web/Widgets/Event/EventWidget/DetailedEventWidget/DetailedEventWidgetController.dart';

class DetailedEventWidget extends StatefulWidget {
  final EventModel data;
  final Function getEventList;
  final String displayDate;

  DetailedEventWidget({this.data, this.getEventList, this.displayDate});

  @override
  _DetailedEventWidgetState createState() => _DetailedEventWidgetState();
}

class _DetailedEventWidgetState extends State<DetailedEventWidget> {
  DetailedEventController detailedEventController = new DetailedEventController();

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
                    "assets/images/eventDetail.svg",
                    width: 300.0,
                  ),
                  SizedBox(
                    width: 125.0,
                  ),
                  Container(
                    width: 600.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'View an event',
                          style: TextStyle(fontSize: 54.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 350.0,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Date & Time: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.displayDate + " at " + widget.data.time,
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
                                      'Event Name: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.eventName,
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
                                      'Event Sponsor: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.eventSponsor,
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
                                      'Created For: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.benefittedPeople,
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
                                      'Description: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Container(
                                      width: 450.0,
                                      child: Text(
                                        widget.data.description,
                                        style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Cost: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      "Rs${widget.data.cost}",
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
                                      'Created by: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.data.firstName + " " + widget.data.lastName,
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
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

                                  await detailedEventController.deleteEvent(widget.data.id, context, widget.getEventList);

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

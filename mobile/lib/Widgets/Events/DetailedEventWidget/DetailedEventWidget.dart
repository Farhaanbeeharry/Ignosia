import 'package:Ignosia/Common/Common.dart';
import 'package:Ignosia/Common/Stem.dart';
import 'package:Ignosia/Model/EventModel.dart';
import 'package:Ignosia/Widgets/Events/DetailedEventWidget/DetailedWidgetController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailedEventWidget extends StatefulWidget {
  final EventModel event;

  DetailedEventWidget({this.event});

  @override
  _DetailedEventWidgetState createState() => _DetailedEventWidgetState();
}

class _DetailedEventWidgetState extends State<DetailedEventWidget> {
  DetailedEventController detailedEventController = new DetailedEventController();

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
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.event.eventName,
                            style: TextStyle(fontSize: 28.0, fontFamily: Stem.bold),
                          ),
                          Spacer(),
                          Container(
                            height: 50.0,
                            width: 50.0,
                            child: NeumorphicButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                child: Icon(FontAwesomeIcons.times),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/images/eventDetail.svg",
                          width: MediaQuery.of(context).size.width * 0.50,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 450,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Created by:",
                                style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                              ),
                              Text(
                                widget.event.firstName + " " + widget.event.lastName,
                                style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Date and Time:",
                                style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                              ),
                              Text(
                                Common.convertNormalDate(widget.event.date) + " at " + widget.event.time,
                                style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Event Sponsor:",
                                style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                              ),
                              Text(
                                widget.event.eventSponsor,
                                style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Created for:",
                                style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                              ),
                              Text(
                                widget.event.benefittedPeople,
                                style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Description:",
                                style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                              ),
                              Text(
                                widget.event.description,
                                style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "Cost (Rs):",
                                style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                              ),
                              Text(
                                widget.event.cost,
                                style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Widgets/Events/EventController.dart';

class EventView extends StatefulWidget {
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  EventController eventController = new EventController();

  callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEventList();
  }

  getEventList() async {
    await eventController.loadEventList(context, callSetState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Text(
                    "Future Events",
                    style: TextStyle(fontSize: 28.0, fontFamily: Stem.bold),
                  ),
                  Spacer(),
                  Container(
                    height: 50.0,
                    width: 70.0,
                    child: NeumorphicButton(
                      onPressed: () async {
                        setState(() {
                          eventController.listLoaded = false;
                        });

                        await eventController.loadEventList(context, callSetState);

                        setState(() {
                          eventController.listLoaded = true;
                        });
                      },
                      child: Center(
                        child: eventController.listLoaded
                            ? Icon(
                                FontAwesomeIcons.sync,
                                size: 24.0,
                              )
                            : SpinKitWave(
                                color: Colors.black,
                                size: 24.0,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 185.0,
                child: SingleChildScrollView(
                    child: Column(
                  children: eventController.eventWidgetList,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

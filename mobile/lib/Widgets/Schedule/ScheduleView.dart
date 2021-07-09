import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Widgets/Schedule/ScheduleController.dart';

class ScheduleView extends StatefulWidget {
  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  ScheduleController scheduleController = new ScheduleController();

  callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await loadSchedules();
  }

  loadSchedules() async {
    await scheduleController.getSchedules(context, callSetState, loadData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe8eaeb),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    "My Schedules",
                    style: TextStyle(fontSize: 28.0, fontFamily: Stem.bold),
                  ),
                  Spacer(),
                  Container(
                    height: 50.0,
                    width: 70.0,
                    child: NeumorphicButton(
                      onPressed: () async {
                        setState(() {
                          scheduleController.listLoaded = false;
                        });

                        await scheduleController.getSchedules(context, callSetState, loadData);

                        setState(() {
                          scheduleController.listLoaded = true;
                        });
                      },
                      child: Center(
                        child: scheduleController.listLoaded
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
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 125.0,
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF09b8a8),
                      const Color(0xFF168a7f),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, top: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Next visit on',
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: Stem.regular),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      Common.nextScheduleDate,
                      style: TextStyle(color: Colors.white, fontSize: 28.0, fontFamily: Stem.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 340.0,
              child: SingleChildScrollView(
                  child: Column(
                children: scheduleController.scheduleWidgetList,
              )),
            )
          ],
        ),
      ),
    );
  }
}

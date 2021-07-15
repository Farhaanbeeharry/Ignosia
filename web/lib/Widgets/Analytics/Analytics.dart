import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Analytics/AnalyticsController.dart';
import 'package:web/Widgets/Analytics/DashWidget/GenderWidget.dart';

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  AnalyticsController analyticsController = new AnalyticsController();

  callSetState() {
    setState(() {});
  }

  getData() async {
    await loadData();
  }

  loadData() async {
    await analyticsController.loadDashboardData(getData, callSetState);
    await analyticsController.getData(getData, callSetState, context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.8) - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: 50.0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.83,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Analytics & Report',
                      style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        Common.displayDate,
                        style: TextStyle(fontSize: 20.0, color: Color(0xFFa3b0cb), fontFamily: 'StemRegular'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.67,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Bugs reported",
                                  style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      analyticsController.refreshBtnIcon = SpinKitWave(
                                        color: Color(0xFF6c63ff),
                                        size: 25.0,
                                      );
                                    });
                                    await loadData();
                                    setState(() {
                                      analyticsController.refreshBtnIcon = Icon(
                                        FontAwesomeIcons.syncAlt,
                                        color: Color(0xFF6c63ff),
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 70.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe1e1e1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    child: analyticsController.refreshBtnIcon,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 380.0,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: Common.bugsWidgetList,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: MediaQuery.of(context).size.height * 0.83,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    color: Colors.white,
                  ),
                  child: analyticsController.dataLoaded
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  DashboardWidget(item: "Male", value: analyticsController.dashboardData.male.toString()),
                                  Spacer(),
                                  DashboardWidget(item: "Female", value: analyticsController.dashboardData.female.toString()),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  DashboardWidget(item: "Other", value: analyticsController.dashboardData.other.toString()),
                                  Spacer(),
                                  DashboardWidget(item: "Cases", value: analyticsController.dashboardData.cases.toString()),
                                ],
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  DashboardWidget(item: "Events", value: analyticsController.dashboardData.events.toString()),
                                  Spacer(),
                                  DashboardWidget(item: "Users", value: analyticsController.dashboardData.users.toString()),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SpinKitWave(
                              color: Colors.black,
                              size: 36.0,
                            ),
                            SizedBox(
                              height: 100.0,
                            ),
                          ],
                        )),
            ],
          ),
        ),
      ),
    );
  }
}

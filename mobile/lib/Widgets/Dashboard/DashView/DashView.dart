import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Widgets/Dashboard/DashView/DashWidget/GenderWidget.dart';

import 'DashController.dart';

class DashView extends StatefulWidget {
  @override
  _DashViewState createState() => _DashViewState();
}

class _DashViewState extends State<DashView> {
  DashController dashController = new DashController();

  callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dashController.loadBeneficiaryData(callSetState);
    getData();
  }

  getData() async {
    await loadData();
  }

  loadData() async {
    await dashController.loadDashboardData(loadData, callSetState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6f9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Dashboard',
                style: TextStyle(color: Colors.black, fontSize: 36.0, fontFamily: Stem.bold),
              ),
              SizedBox(
                height: 25.0,
              ),
              Center(
                child: SvgPicture.asset(
                  "assets/images/dashboardMobile.svg",
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.45,
                child: SingleChildScrollView(
                  child: dashController.dataLoaded
                      ? Column(
                          children: [
                            Row(
                              children: [
                                DashboardWidget(
                                  item: "Male",
                                  value: dashController.dashboardData.male.toString(),
                                ),
                                Spacer(),
                                DashboardWidget(
                                  item: "Female",
                                  value: dashController.dashboardData.female.toString(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                DashboardWidget(
                                  item: "Other",
                                  value: dashController.dashboardData.other.toString(),
                                ),
                                Spacer(),
                                DashboardWidget(
                                  item: "Cases",
                                  value: dashController.dashboardData.cases.toString(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                DashboardWidget(
                                  item: "Events",
                                  value: dashController.dashboardData.events.toString(),
                                ),
                                Spacer(),
                                DashboardWidget(
                                  item: "Users",
                                  value: dashController.dashboardData.users.toString(),
                                ),
                              ],
                            ),
                          ],
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
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

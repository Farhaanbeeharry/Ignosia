import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Widgets/Dashboard/DashView/DashController.dart';
import 'package:mobile/Widgets/Dashboard/DashView/GenderDashboardWidget/GenderWidget.dart';

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
    dashController.loadGenderData(callSetState);
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
                                  value: dashController.genderValues[0],
                                ),
                                Spacer(),
                                DashboardWidget(
                                  item: "Female",
                                  value: dashController.genderValues[1],
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
                                  value: dashController.genderValues[2],
                                ),
                                Spacer(),
                                DashboardWidget(
                                  item: "Cases",
                                  value: "12",
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
                                  value: "14",
                                ),
                                Spacer(),
                                DashboardWidget(
                                  item: "Users",
                                  value: "12",
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

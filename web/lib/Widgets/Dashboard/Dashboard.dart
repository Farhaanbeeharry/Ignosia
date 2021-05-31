import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Widgets/Dashboard/DashboardController.dart';

class Dashboard extends StatefulWidget {
  final Function moveToFinancePage;

  Dashboard({this.moveToFinancePage});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dashboardController = new DashboardController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    Common.setDate();
  }

  callSetState() {
    setState(() {});
  }

  loadData() async {
    await loadDashboardData();
  }

  loadDashboardData() async {
    setState(() {
      dashboardController.loadingWidget = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    if (await dashboardController.getRecentTransactionData(callSetState) && await dashboardController.getDashboardData(callSetState)) {
      setState(() {
        dashboardController.loadingWidget = Container();
      });
    } else {
      setState(() {
        dashboardController.loadingWidget = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                loadData();
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.syncAlt,
                  color: Color(0xFF6c63ff),
                ),
              ),
            )
          ],
        );
      });
    }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7.5),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      child: dashboardController.loadingWidget,
                    ),
                  ),
                ],
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.67,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 80.0,
                          child: Row(
                            children: [
                              Container(
                                width: 150.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: Color(0xFFff9e9e),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.user,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: 100.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Members',
                                            style: TextStyle(fontSize: 16.0, color: Color(0xFFa3b0cb), fontFamily: 'StemBold'),
                                          ),
                                          Text(dashboardController.memberData, style: TextStyle(fontSize: 18.0, color: Colors.black, fontFamily: 'StemMedium'))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 2.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.black38,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 130.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: Color(0xFFac9eff),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.archive,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: 100.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Cases',
                                            style: TextStyle(fontSize: 16.0, color: Color(0xFFa3b0cb), fontFamily: 'StemBold'),
                                          ),
                                          Text(dashboardController.caseData, style: TextStyle(fontSize: 18.0, color: Colors.black, fontFamily: 'StemMedium'))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 2.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.black38,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 170.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: Color(0xFFffc19e),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.trophy,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: 100.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Beneficiaries',
                                            style: TextStyle(fontSize: 16.0, color: Color(0xFFa3b0cb), fontFamily: 'StemBold'),
                                          ),
                                          Text(dashboardController.beneficiaryData, style: TextStyle(fontSize: 18.0, color: Colors.black, fontFamily: 'StemMedium'))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 2.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Colors.black38,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 150.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF92c9fb),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.clipboard,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Container(
                                      height: 100.0,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Events',
                                            style: TextStyle(fontSize: 16.0, color: Color(0xFFa3b0cb), fontFamily: 'StemBold'),
                                          ),
                                          Text(dashboardController.eventData, style: TextStyle(fontSize: 18.0, color: Colors.black, fontFamily: 'StemMedium'))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: (MediaQuery.of(context).size.height * 0.67) - 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: SvgPicture.asset("assets/images/dashboard.svg"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width * 0.35) - 135,
                    height: MediaQuery.of(context).size.height * 0.67,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent transactions',
                            style: TextStyle(
                              fontFamily: 'StemMedium',
                              fontSize: 26.0,
                              color: Color(0xFF6c63ff),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            child: Column(
                              children: Common.recentTransactionWidgetList,
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 45.0,
                            width: 345.0,
                            child: TextButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  widget.moveToFinancePage();
                                },
                                style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                child: Text(
                                  'View all',
                                  style: Common.buttonTextStyle,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

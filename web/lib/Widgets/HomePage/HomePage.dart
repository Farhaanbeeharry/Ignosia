import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Widgets/Analytics/Analytics.dart';
import 'package:web/Widgets/Beneficiary/BeneficiaryView.dart';
import 'package:web/Widgets/Cases/CasesView.dart';
import 'package:web/Widgets/Dashboard/Dashboard.dart';
import 'package:web/Widgets/Event/EventView.dart';
import 'package:web/Widgets/Finance/FinanceView.dart';
import 'package:web/Widgets/Homepage/HomepageController.dart';
import 'package:web/Widgets/Members/MembersView.dart';
import 'package:web/Widgets/Schedule/ScheduleView.dart';
import 'package:web/Widgets/Settings/Settings.dart';
import 'package:web/Widgets/Validator/ValidatorView.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomepageController homepageController = HomepageController();

  void changeAllToUnselected() {
    homepageController.selectedNavBar['dashboard'] = false;
    homepageController.currentDashboardBox = homepageController.unselectedBox;
    homepageController.currentDashboardText = homepageController.unselectedText;
    homepageController.selectedNavBar['cases'] = false;
    homepageController.currentCasesBox = homepageController.unselectedBox;
    homepageController.currentCasesText = homepageController.unselectedText;
    homepageController.selectedNavBar['schedule'] = false;
    homepageController.currentScheduleBox = homepageController.unselectedBox;
    homepageController.currentScheduleText = homepageController.unselectedText;
    homepageController.selectedNavBar['validator'] = false;
    homepageController.currentValidatorBox = homepageController.unselectedBox;
    homepageController.currentValidatorText = homepageController.unselectedText;
    homepageController.selectedNavBar['finance'] = false;
    homepageController.currentFinanceBox = homepageController.unselectedBox;
    homepageController.currentFinanceText = homepageController.unselectedText;
    homepageController.selectedNavBar['event'] = false;
    homepageController.currentEventBox = homepageController.unselectedBox;
    homepageController.currentEventText = homepageController.unselectedText;
    homepageController.selectedNavBar['members'] = false;
    homepageController.currentMembersBox = homepageController.unselectedBox;
    homepageController.currentMembersText = homepageController.unselectedText;
    homepageController.selectedNavBar['beneficiary'] = false;
    homepageController.currentBeneficiaryBox = homepageController.unselectedBox;
    homepageController.currentBeneficiaryText = homepageController.unselectedText;
    homepageController.selectedNavBar['analytics'] = false;
    homepageController.currentAnalyticsBox = homepageController.unselectedBox;
    homepageController.currentAnalyticsText = homepageController.unselectedText;
    homepageController.selectedNavBar['settings'] = false;
    homepageController.currentSettingsBox = homepageController.unselectedBox;
    homepageController.currentSettingsText = homepageController.unselectedText;
  }

  final PageController sliderController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: Container(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Ignosia',
                          style: TextStyle(fontSize: 44.0, color: Color(0XFF6C63FF), fontFamily: 'StemBold'),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['dashboard']) {
                            if (value) {
                              setState(() {
                                homepageController.currentDashboardBox = homepageController.hoverBox;
                                homepageController.currentDashboardText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentDashboardBox = homepageController.unselectedBox;
                                homepageController.currentDashboardText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['dashboard']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['dashboard'] = true;
                            sliderController.animateToPage(0, duration: new Duration(milliseconds: 300), curve: Curves.linear);
                            setState(() {
                              homepageController.currentDashboardBox = homepageController.selectedBox;
                              homepageController.currentDashboardText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentDashboardBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.th,
                                color: homepageController.currentDashboardText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Dashboard',
                                  style: TextStyle(color: homepageController.currentDashboardText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['cases']) {
                            if (value) {
                              setState(() {
                                homepageController.currentCasesBox = homepageController.hoverBox;
                                homepageController.currentCasesText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentCasesBox = homepageController.unselectedBox;
                                homepageController.currentCasesText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['cases']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['cases'] = true;
                            sliderController.animateToPage(1, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentCasesBox = homepageController.selectedBox;
                              homepageController.currentCasesText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentCasesBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.fileMedical,
                                color: homepageController.currentCasesText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Cases',
                                  style: TextStyle(color: homepageController.currentCasesText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['schedule']) {
                            if (value) {
                              setState(() {
                                homepageController.currentScheduleBox = homepageController.hoverBox;
                                homepageController.currentScheduleText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentScheduleBox = homepageController.unselectedBox;
                                homepageController.currentScheduleText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['schedule']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['schedule'] = true;
                            sliderController.animateToPage(2, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentScheduleBox = homepageController.selectedBox;
                              homepageController.currentScheduleText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentScheduleBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.calendarPlus,
                                color: homepageController.currentScheduleText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Schedules',
                                  style: TextStyle(color: homepageController.currentScheduleText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['validator']) {
                            if (value) {
                              setState(() {
                                homepageController.currentValidatorBox = homepageController.hoverBox;
                                homepageController.currentValidatorText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentValidatorBox = homepageController.unselectedBox;
                                homepageController.currentValidatorText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['validator']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['validator'] = true;
                            sliderController.animateToPage(3, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentValidatorBox = homepageController.selectedBox;
                              homepageController.currentValidatorText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentValidatorBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.certificate,
                                color: homepageController.currentValidatorText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Validator',
                                  style: TextStyle(color: homepageController.currentValidatorText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['finance']) {
                            if (value) {
                              setState(() {
                                homepageController.currentFinanceBox = homepageController.hoverBox;
                                homepageController.currentFinanceText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentFinanceBox = homepageController.unselectedBox;
                                homepageController.currentFinanceText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['finance']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['finance'] = true;
                            sliderController.animateToPage(4, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentFinanceBox = homepageController.selectedBox;
                              homepageController.currentFinanceText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentFinanceBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.handHoldingUsd,
                                color: homepageController.currentFinanceText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Finance',
                                  style: TextStyle(color: homepageController.currentFinanceText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['event']) {
                            if (value) {
                              setState(() {
                                homepageController.currentEventBox = homepageController.hoverBox;
                                homepageController.currentEventText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentEventBox = homepageController.unselectedBox;
                                homepageController.currentEventText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['event']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['event'] = true;
                            sliderController.animateToPage(5, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentEventBox = homepageController.selectedBox;
                              homepageController.currentEventText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentEventBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.glassCheers,
                                color: homepageController.currentEventText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Events',
                                  style: TextStyle(color: homepageController.currentEventText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['members']) {
                            if (value) {
                              setState(() {
                                homepageController.currentMembersBox = homepageController.hoverBox;
                                homepageController.currentMembersText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentMembersBox = homepageController.unselectedBox;
                                homepageController.currentMembersText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['members']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['members'] = true;
                            sliderController.animateToPage(6, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentMembersBox = homepageController.selectedBox;
                              homepageController.currentMembersText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentMembersBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.users,
                                color: homepageController.currentMembersText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Members',
                                  style: TextStyle(color: homepageController.currentMembersText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['beneficiary']) {
                            if (value) {
                              setState(() {
                                homepageController.currentBeneficiaryBox = homepageController.hoverBox;
                                homepageController.currentBeneficiaryText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentBeneficiaryBox = homepageController.unselectedBox;
                                homepageController.currentBeneficiaryText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['beneficiary']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['beneficiary'] = true;
                            sliderController.animateToPage(7, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentBeneficiaryBox = homepageController.selectedBox;
                              homepageController.currentBeneficiaryText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentBeneficiaryBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.idCard,
                                color: homepageController.currentBeneficiaryText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Beneficiary',
                                  style: TextStyle(color: homepageController.currentBeneficiaryText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['analytics']) {
                            if (value) {
                              setState(() {
                                homepageController.currentAnalyticsBox = homepageController.hoverBox;
                                homepageController.currentAnalyticsText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentAnalyticsBox = homepageController.unselectedBox;
                                homepageController.currentAnalyticsText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['analytics']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['analytics'] = true;
                            sliderController.animateToPage(8, duration: new Duration(milliseconds: 300), curve: Curves.linear);

                            setState(() {
                              homepageController.currentAnalyticsBox = homepageController.selectedBox;
                              homepageController.currentAnalyticsText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentAnalyticsBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.chartBar,
                                color: homepageController.currentAnalyticsText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Analytics',
                                  style: TextStyle(color: homepageController.currentAnalyticsText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onHover: (value) {
                          if (!homepageController.selectedNavBar['settings']) {
                            if (value) {
                              setState(() {
                                homepageController.currentSettingsBox = homepageController.hoverBox;
                                homepageController.currentSettingsText = homepageController.hoverText;
                              });
                            } else {
                              setState(() {
                                homepageController.currentSettingsBox = homepageController.unselectedBox;
                                homepageController.currentSettingsText = homepageController.unselectedText;
                              });
                            }
                          }
                        },
                        onTap: () {
                          if (!homepageController.selectedNavBar['settings']) {
                            changeAllToUnselected();
                            homepageController.selectedNavBar['settings'] = true;
                            sliderController.animateToPage(9, duration: new Duration(milliseconds: 300), curve: Curves.elasticIn);

                            setState(() {
                              homepageController.currentSettingsBox = homepageController.selectedBox;
                              homepageController.currentSettingsText = homepageController.selectedText;
                            });
                          }
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentSettingsBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.cog,
                                color: homepageController.currentSettingsText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Settings',
                                  style: TextStyle(color: homepageController.currentSettingsText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      InkWell(
                        onHover: (value) {
                          if (value) {
                            setState(() {
                              homepageController.currentLogoutBox = homepageController.hoverBox;
                              homepageController.currentLogoutText = homepageController.hoverText;
                            });
                          } else {
                            setState(() {
                              homepageController.currentLogoutBox = Colors.white;
                              homepageController.currentLogoutText = Colors.black;
                            });
                          }
                        },
                        onTap: () {
                          Navigator.pushNamed(context, '/Login');
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 0.2) - 100,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: homepageController.currentLogoutBox,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25.0,
                              ),
                              Icon(
                                FontAwesomeIcons.signOutAlt,
                                color: homepageController.currentLogoutText,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Log out',
                                  style: TextStyle(color: homepageController.currentLogoutText, fontFamily: 'StemRegular', fontSize: 18.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
                child: Container(
                  width: (MediaQuery.of(context).size.width * 0.8) - 60,
                  decoration: BoxDecoration(
                    color: Color(0x1A000000),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: PageView(
                    physics: new NeverScrollableScrollPhysics(),
                    controller: sliderController,
                    children: <Widget>[
                      MembersView(),
                      Dashboard(),
                      CaseView(),
                      ScheduleView(),
                      ValidatorView(),
                      Finance(),
                      EventView(),
                      BeneficiaryView(),
                      Analytics(),
                      Settings(),
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

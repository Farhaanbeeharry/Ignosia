import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Schedule/ScheduleController.dart';

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

  clearInputs() {
    scheduleController.selectedDate = 'Choose date';
    scheduleController.isTimeSelected = false;
    SetSchedule.selectedUserID = null;
    SetSchedule.selectedDate = "null";
    SetSchedule.selectedTime = "null";
  }

  loadData() async {
    setState(() {
      scheduleController.caseRefreshBtnIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await loadScheduleData();
    await scheduleController.getMembersList();
    await loadCaseData();
    setState(() {
      scheduleController.caseRefreshBtnIcon = Icon(
        FontAwesomeIcons.syncAlt,
        color: Color(0xFF6c63ff),
      );
    });
  }

  loadCaseData() async {
    setState(() {
      scheduleController.caseRefreshBtnIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await scheduleController.getScheduleCaseList(callSetState, context, loadData, clearInputs);
    setState(() {
      scheduleController.caseRefreshBtnIcon = Icon(
        FontAwesomeIcons.syncAlt,
        color: Color(0xFF6c63ff),
      );
    });
  }

  loadScheduleData() async {
    setState(() {
      scheduleController.refreshBtnIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await scheduleController.getScheduleList(callSetState, loadData);
    setState(() {
      scheduleController.refreshBtnIcon = Icon(
        FontAwesomeIcons.syncAlt,
        color: Color(0xFF6c63ff),
      );
    });
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
                height: MediaQuery.of(context).size.height * 0.82,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Schedules',
                      style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        Common.displayDate,
                        style: TextStyle(fontSize: 20.0, color: Color(0xFFa3b0cb), fontFamily: 'StemRegular'),
                      ),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.65,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Schedules',
                                  style: TextStyle(fontSize: 36.0, color: Color(0xFF6c63ff), fontFamily: 'StemMedium'),
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Container(
                                  width: 175.0,
                                  child: TextFormField(
                                    onChanged: (value) async {
                                      if (value.isEmpty) {
                                        await loadScheduleData();
                                      } else {
                                        await scheduleController.displayResult(value, callSetState, loadScheduleData);
                                      }
                                    },
                                    validator: (emailAddress) {
                                      return null;
                                    },
                                    style: Common.labelTextStyle,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 50.0, left: 20.0),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          child: Container(
                                            width: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xFF6c63ff),
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.search,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      labelText: 'Search ...',
                                      labelStyle: Common.labelTextStyle,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    loadScheduleData();
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
                                    child: scheduleController.refreshBtnIcon,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: Common.scheduleWidgetList,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 60.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.325,
                height: MediaQuery.of(context).size.height * 0.82,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                width: 185.0,
                                height: 60.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        'Date: ',
                                        style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                                      ),
                                      Text(
                                        '${scheduleController.selectedDate}',
                                        style: TextStyle(fontSize: 18.0, fontFamily: Stem.regular),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () async {
                                  final DateTime picked = await showDatePicker(
                                    context: context,
                                    initialDate: scheduleController.dateToday, // Refer step 1
                                    firstDate: scheduleController.dateToday,
                                    lastDate: DateTime(DateTime.now().year + 2),
                                  );
                                  String dateRAW;
                                  if (picked != null && picked.toString() != scheduleController.selectedDate) {
                                    dateRAW = picked.toString();
                                    String displayDate = dateRAW[8] + dateRAW[9] + "/" + dateRAW[5] + dateRAW[6] + "/" + dateRAW[0] + dateRAW[1] + dateRAW[2] + dateRAW[3];

                                    scheduleController.selectedDate = displayDate;

                                    setState(() {
                                      scheduleController.selectedDate = displayDate;
                                      SetSchedule.selectedDate = displayDate;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6c63ff),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  width: 60.0,
                                  height: 57.0,
                                  child: Icon(
                                    FontAwesomeIcons.calendarDay,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 200.0,
                            height: 60.0,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: DropdownSearch<String>(
                                mode: Mode.MENU,
                                showSelectedItem: true,
                                items: SetSchedule.stringMobileUsers,
                                label: "Assign to...",
                                onChanged: (value) {
                                  List<String> name = value.split(" ");
                                  for (var user in SetSchedule.mobileUsers) {
                                    if (user.firstName == name[0] && user.lastName == name[1]) {
                                      SetSchedule.selectedUserID = user.iD;
                                    }
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                width: 185.0,
                                height: 60.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        'Time: ',
                                        style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                                      ),
                                      !scheduleController.isTimeSelected
                                          ? Text(
                                              '${scheduleController.initialTime}',
                                              style: TextStyle(fontSize: 18.0, fontFamily: Stem.regular),
                                            )
                                          : Text(
                                              '${scheduleController.displayTime}',
                                              style: TextStyle(fontSize: 18.0, fontFamily: Stem.regular),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap: () async {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  scheduleController.selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(hour: 7, minute: 15),
                                    initialEntryMode: TimePickerEntryMode.input,
                                  );

                                  scheduleController.displayTime = scheduleController.selectedTime.toString()[10] + scheduleController.selectedTime.toString()[11] + scheduleController.selectedTime.toString()[12] + scheduleController.selectedTime.toString()[13] + scheduleController.selectedTime.toString()[14];

                                  setState(() {
                                    scheduleController.isTimeSelected = true;
                                    SetSchedule.selectedTime = scheduleController.displayTime;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6c63ff),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  width: 60.0,
                                  height: 57.0,
                                  child: Icon(
                                    FontAwesomeIcons.solidClock,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            width: 130.0,
                            height: 60.0,
                            child: TextButton(
                              onPressed: () {
                                FocusScope.of(context).requestFocus(new FocusNode());
                                setState(() {
                                  clearInputs();
                                });
                              },
                              style: TextButton.styleFrom(backgroundColor: Color(0XFF6C63FF), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                              child: Text(
                                "Clear inputs",
                                style: Common.buttonTextStyle,
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              loadCaseData();
                            },
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFe1e1e1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: scheduleController.caseRefreshBtnIcon,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Container(
                        width: 470.0,
                        height: 430.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFe1e1e1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: Common.scheduleCaseWidgetList,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                      )
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

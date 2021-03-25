import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Schedule/CaseScheduleWidget/CaseScheduleWidget.dart';
import 'package:web/Widgets/Schedule/ScheduleController.dart';
import 'package:web/Widgets/Schedule/ScheduleWidget/ScheduleWidget.dart';

class ScheduleView extends StatefulWidget {
  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  ScheduleController scheduleController = new ScheduleController();

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
                        'Sunday, 21 March 2021',
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
                                  style: TextStyle(fontSize: 36.0, color: Color(0xFF3f3d56), fontFamily: 'StemMedium'),
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Container(
                                  width: 175.0,
                                  child: TextFormField(
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
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Container(
                                      width: 45.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF6c63ff),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.undoAlt,
                                        color: Colors.white,
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
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ScheduleWidget(),
                                    ScheduleWidget(),
                                    ScheduleWidget(),
                                    ScheduleWidget(),
                                    ScheduleWidget(),
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
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(DateTime.now().year + 2),
                                  );
                                  String dateRAW;
                                  if (picked != null && picked.toString() != scheduleController.selectedDate) {
                                    dateRAW = picked.toString();
                                    String displayDate = dateRAW[8] + dateRAW[9] + "/" + dateRAW[5] + dateRAW[6] + "/" + dateRAW[0] + dateRAW[1] + dateRAW[2] + dateRAW[3];

                                    scheduleController.selectedDate = displayDate;

                                    setState(() {
                                      scheduleController.selectedDate = displayDate;
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
                            child: TextFormField(
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
                                contentPadding: EdgeInsets.only(top: 50.0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(FontAwesomeIcons.signature),
                                ),
                                labelText: 'Assign to...',
                                labelStyle: Common.labelTextStyle,
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
                            width: 200.0,
                            height: 60.0,
                            child: TextButton(
                              onPressed: () {
                                FocusScope.of(context).requestFocus(new FocusNode());

                                //Navigator.pushNamed(context, '/');
                              },
                              style: TextButton.styleFrom(backgroundColor: Color(0XFF6C63FF), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                              child: Text(
                                "Clear inputs",
                                style: Common.buttonTextStyle,
                              ),
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
                                children: [
                                  CaseScheduleWidget(),
                                  CaseScheduleWidget(),
                                  CaseScheduleWidget(),
                                  CaseScheduleWidget(),
                                  CaseScheduleWidget(),
                                ],
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

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Event/EventController.dart';

class EventView extends StatefulWidget {
  @override
  _EventViewState createState() => _EventViewState();
}

class _EventViewState extends State<EventView> {
  EventController eventController = new EventController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadEvent();
  }

  callSetState() {
    setState(() {});
  }

  loadEvent() async {
    await getEventList();
  }

  getEventList() async {
    setState(() {
      eventController.refreshBtnIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await eventController.getEventList(callSetState, loadEvent);
    setState(() {
      eventController.refreshBtnIcon = Icon(
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
                child: Form(
                  key: eventController.createEventKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Events',
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
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create event',
                                style: TextStyle(fontSize: 32.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 345.0,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 215.0,
                                            child: TextFormField(
                                              validator: (eventName) {
                                                if (eventName.isEmpty) {
                                                  return "Event name cannot be empty!";
                                                } else if (eventName.length > 64) {
                                                  return "Event name is too long";
                                                } else
                                                  return null;
                                              },
                                              controller: eventController.eventNameController,
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
                                                  child: Icon(FontAwesomeIcons.glassCheers),
                                                ),
                                                labelText: 'Event name',
                                                labelStyle: Common.labelTextStyle,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 215.0,
                                            child: TextFormField(
                                              validator: (sponsorName) {
                                                if (sponsorName.isEmpty) {
                                                  return "Sponsor name cannot be empty!";
                                                } else if (sponsorName.length > 64) {
                                                  return "Sponsor name too long";
                                                } else
                                                  return null;
                                              },
                                              controller: eventController.sponsorNameController,
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
                                                  child: Icon(FontAwesomeIcons.handsHelping),
                                                ),
                                                labelText: 'Sponsor name',
                                                labelStyle: Common.labelTextStyle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 215.0,
                                            child: TextFormField(
                                              validator: (createdFor) {
                                                if (createdFor.isEmpty) {
                                                  return "This field cannot be empty!";
                                                } else if (createdFor.length > 64) {
                                                  return "This field contains too many characters!";
                                                } else
                                                  return null;
                                              },
                                              controller: eventController.createdForController,
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
                                                  child: Icon(FontAwesomeIcons.peopleCarry),
                                                ),
                                                labelText: 'Created for',
                                                labelStyle: Common.labelTextStyle,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 215.0,
                                            child: TextFormField(
                                              validator: (cost) {
                                                if (cost.isEmpty) {
                                                  return "Cost cannot be empty!";
                                                } else if (!isNumeric(cost)) {
                                                  return "Invalid cost!";
                                                } else if (int.parse(cost) < 0) {
                                                  return "Invalid cost!";
                                                } else
                                                  return null;
                                              },
                                              controller: eventController.costController,
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
                                                  child: Icon(FontAwesomeIcons.coins),
                                                ),
                                                labelText: 'Cost',
                                                labelStyle: Common.labelTextStyle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 215.0,
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 160.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Color(0xFFbbbbbb)),
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 5.0),
                                                    child: !eventController.isDateSelected
                                                        ? Text(
                                                            'Choose date',
                                                            style: TextStyle(color: eventController.chooseDateColor, fontSize: 20.0, fontFamily: Stem.regular),
                                                          )
                                                        : Text(
                                                            eventController.selectedDate,
                                                            style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: Stem.regular),
                                                          ),
                                                  ),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () async {
                                                    FocusScope.of(context).requestFocus(new FocusNode());

                                                    final DateTime picked = await showDatePicker(
                                                      context: context,
                                                      initialDate: eventController.dateToday, // Refer step 1
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(DateTime.now().year + 2),
                                                    );
                                                    String dateRAW;
                                                    if (picked != null && picked.toString() != eventController.selectedDate) {
                                                      dateRAW = picked.toString();
                                                      String displayDate = dateRAW[8] + dateRAW[9] + "/" + dateRAW[5] + dateRAW[6] + "/" + dateRAW[0] + dateRAW[1] + dateRAW[2] + dateRAW[3];

                                                      eventController.selectedDate = displayDate;
                                                      eventController.isDateSelected = true;
                                                      setState(() {
                                                        eventController.selectedDate = displayDate;
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      color: Color(0xFF6c63ff),
                                                    ),
                                                    child: Icon(
                                                      FontAwesomeIcons.calendarDay,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            height: 60.0,
                                            width: 215.0,
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  width: 160.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: Color(0xFFbbbbbb)),
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 5.0),
                                                    child: !eventController.isTimeSelected
                                                        ? Text(
                                                            'Choose time',
                                                            style: TextStyle(color: eventController.chooseTimeColor, fontSize: 20.0, fontFamily: Stem.regular),
                                                          )
                                                        : Text(
                                                            eventController.displayTime,
                                                            style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: Stem.regular),
                                                          ),
                                                  ),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () async {
                                                    FocusScope.of(context).requestFocus(new FocusNode());

                                                    eventController.selectedTime = await showTimePicker(
                                                      context: context,
                                                      initialTime: TimeOfDay(hour: 7, minute: 15),
                                                      initialEntryMode: TimePickerEntryMode.input,
                                                    );

                                                    eventController.displayTime = eventController.selectedTime.toString()[10] + eventController.selectedTime.toString()[11] + eventController.selectedTime.toString()[12] + eventController.selectedTime.toString()[13] + eventController.selectedTime.toString()[14];

                                                    setState(() {
                                                      eventController.isTimeSelected = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      color: Color(0xFF6c63ff),
                                                    ),
                                                    child: Icon(
                                                      FontAwesomeIcons.solidClock,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Container(
                                        child: TextFormField(
                                          validator: (description) {
                                            if (description.isEmpty) {
                                              return "Description cannot be empty!";
                                            } else
                                              return null;
                                          },
                                          controller: eventController.descriptionController,
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
                                              child: Icon(FontAwesomeIcons.solidStickyNote),
                                            ),
                                            labelText: 'Description',
                                            labelStyle: Common.labelTextStyle,
                                          ),
                                          minLines: 4,
                                          maxLines: 4,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                width: 500.0,
                                child: TextButton(
                                  onPressed: () async {
                                    FocusScope.of(context).requestFocus(new FocusNode());

                                    if (eventController.selectedDate == 'Choose date') {
                                      setState(() {
                                        eventController.chooseDateColor = Colors.red;
                                      });
                                    } else {
                                      setState(() {
                                        eventController.chooseDateColor = Colors.black;
                                      });
                                    }

                                    if (eventController.displayTime == 'Choose time') {
                                      setState(() {
                                        eventController.chooseTimeColor = Colors.red;
                                      });
                                    } else {
                                      setState(() {
                                        eventController.chooseTimeColor = Colors.black;
                                      });
                                    }

                                    if (eventController.createEventKey.currentState.validate() && eventController.selectedDate != 'Choose date' && eventController.displayTime != 'Choose time') {
                                      setState(() {
                                        eventController.createEventBtn = SpinKitWave(
                                          color: Colors.white,
                                          size: 25.0,
                                        );
                                      });
                                      if (await eventController.createEvent(eventController.eventNameController.text, eventController.sponsorNameController.text, eventController.createdForController.text, eventController.costController.text, eventController.descriptionController.text, context)) {
                                        setState(() {
                                          eventController.eventNameController.clear();
                                          eventController.sponsorNameController.clear();
                                          eventController.createdForController.clear();
                                          eventController.costController.clear();
                                          eventController.descriptionController.clear();
                                          eventController.displayTime = "Choose time";
                                          eventController.selectedDate = "Choose date";
                                        });
                                      }
                                      loadEvent();
                                      setState(() {
                                        eventController.createEventBtn = Text(
                                          'Create event',
                                          style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: Stem.regular),
                                        );
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                  child: eventController.createEventBtn,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
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
                  padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Upcoming Events",
                            style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              getEventList();
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
                              child: eventController.refreshBtnIcon,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        height: 475.0,
                        child: SingleChildScrollView(
                          child: Column(
                            children: Common.eventWidgetList,
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
      ),
    );
  }
}

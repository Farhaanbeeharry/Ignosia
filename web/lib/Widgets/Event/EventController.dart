import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/EventModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Event/EventWidget/EventWidget.dart';

class EventController {
  Widget refreshBtnIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  Widget createEventBtn = Text(
    'Create event',
    style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: Stem.regular),
  );

  Color chooseDateColor = Colors.black;
  Color chooseTimeColor = Colors.black;

  bool isDateSelected = false;
  DateTime dateToday = DateTime.now();
  String selectedDate = 'Choose date';

  bool isTimeSelected = false;
  String initialTime = 'Choose time';
  String displayTime = 'Choose time';
  TimeOfDay selectedTime = TimeOfDay.now().replacing(minute: 30);

  TextEditingController eventNameController = new TextEditingController();
  TextEditingController sponsorNameController = new TextEditingController();
  TextEditingController createdForController = new TextEditingController();
  TextEditingController costController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  final createEventKey = GlobalKey<FormState>();

  Future<bool> createEvent(String eventName, String sponsorName, String createdFor, String cost, String description, BuildContext context) async {
    var uuid = Uuid();
    String id = uuid.v1();
    var body = {"ID": id, "createdBy": Common.loggedInData.iD, "eventName": eventName, "sponsorName": sponsorName, "createdFor": createdFor, "cost": cost, "date": selectedDate, "time": displayTime, "description": description};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.createEvent), body);

    if (response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "New event created!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "Event '$eventName' saved successfully for $selectedDate!",
        btnOkOnPress: () {},
      ).show();
      return true;
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to create event!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
      return false;
    }
  }

  Future<void> getEventList(Function callSetState, Function getEventList) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getEventList), {});

    bool emptyListCheck = true;

    for (var datum in response.data) {
      EventModel event = EventModel().fromJson(datum);
      if (Common.checkFutureDate(event.date + event.time)) emptyListCheck = false;
    }

    if (response.success) {
      Common.eventWidgetList.clear();
      if (emptyListCheck) {
        Common.eventWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No upcoming event found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
      } else {
        Common.eventList.clear();

        for (int i = 0; i < response.data.length; i++) {
          EventModel event = EventModel().fromJson(response.data[i]);
          if (Common.checkFutureDate(event.date + event.time)) Common.eventList.add(event);
        }

        EventModel tempTransaction;

        for (int i = 1; i < Common.eventList.length; i++) {
          for (int j = i; j > 0; j--) {
            if (Common.compareDate(Common.eventList[j].date + Common.eventList[j].time, Common.eventList[j - 1].date + Common.eventList[j - 1].time) == -1) {
              tempTransaction = Common.eventList[j];
              Common.eventList[j] = Common.eventList[j - 1];
              Common.eventList[j - 1] = tempTransaction;
            }
          }
        }

        for (var event in Common.eventList) {
          if (event.deleted == "false") {
            Common.eventWidgetList.add(EventWidget(data: event, getEventList: getEventList));
          }
        }
      }
    } else {
      Common.eventWidgetList.clear();
      Common.eventWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch event list! Click \'Refresh\' to try again.',
            style: TextStyle(
              fontFamily: Stem.light,
              color: Colors.red,
              fontSize: 15.0,
            ),
          ),
        ],
      ));
    }
  }
}

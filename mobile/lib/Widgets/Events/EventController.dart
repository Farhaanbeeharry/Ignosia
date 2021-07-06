import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/Common/API.dart';
import 'package:mobile/Common/ApiUrl.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/EventModel.dart';
import 'package:mobile/Model/ResponseModel.dart';
import 'package:mobile/Widgets/Events/EventWidget/EventWidget.dart';

class EventController {
  bool listLoaded = false;

  List<Widget> eventWidgetList = new List<Widget>();

  Future<void> loadEventList(BuildContext context, Function callSetState) async {
    listLoaded = false;
    callSetState();

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getEventList), {});

    if (response.success) {
      eventWidgetList.clear();

      List<EventModel> events = new List<EventModel>();

      for (int i = 0; i < response.data.length; i++) {
        EventModel event = EventModel().fromJson(response.data[i]);
        if (Common.checkFutureDate(event.date + event.time)) events.add(event);
      }

      if (events.length == 0) {
        eventWidgetList.add(
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/empty.svg",
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  Text(
                    "No event found!",
                    style: TextStyle(fontSize: 24.0, fontFamily: Stem.regular),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        EventModel tempTransaction;

        for (int i = 1; i < events.length; i++) {
          for (int j = i; j > 0; j--) {
            if (Common.compareDate(events[j].date + events[j].time, events[j - 1].date + events[j - 1].time) == -1) {
              tempTransaction = events[j];
              events[j] = events[j - 1];
              events[j - 1] = tempTransaction;
            }
          }
        }

        for (var event in events) {
          eventWidgetList.add(EventWidget(event: event));
        }
      }

      listLoaded = true;
      callSetState();
    } else {
      eventWidgetList.add(
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/images/error.svg",
                  width: MediaQuery.of(context).size.width * 0.75,
                ),
                SizedBox(
                  height: 45.0,
                ),
                Text(
                  "Failed to load data!",
                  style: TextStyle(fontSize: 24.0, fontFamily: Stem.regular),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

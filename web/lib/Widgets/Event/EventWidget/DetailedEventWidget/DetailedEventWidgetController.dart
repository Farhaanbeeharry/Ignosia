import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Model/ResponseModel.dart';

class DetailedEventController {
  Future<void> deleteEvent(String id, BuildContext context, Function refreshEventList) async {
    var body = {"id": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteEvent), body);
    if (response.success) {
      int value;
      for (int i = 0; i < Common.eventList.length; i++) {
        if (Common.eventList[i].id == id) {
          value = i;
          break;
        }
      }
      Common.eventList.removeAt(value);
      Common.eventWidgetList.removeAt(value);
      refreshEventList();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Event deleted!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: "Event with ID '$id' has been deleted successfully!",
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to delete event!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

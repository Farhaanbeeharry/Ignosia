import 'package:Ignosia/Common/API.dart';
import 'package:Ignosia/Common/ApiUrl.dart';
import 'package:Ignosia/Common/Stem.dart';
import 'package:Ignosia/Model/RecipientModel.dart';
import 'package:Ignosia/Model/ResponseModel.dart';
import 'package:Ignosia/Widgets/Compose/RecipientWidget/RecipientWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComposeController {
  bool listLoaded = false;
  List<Widget> recipientWidgetList = new List<Widget>();

  Future<void> loadRecipientList(BuildContext context, Function callSetState) async {
    listLoaded = false;
    callSetState();

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getRecipientList), {});

    if (response.success) {
      recipientWidgetList.clear();

      List<RecipientModel> recipients = new List<RecipientModel>();

      for (int i = 0; i < response.data.length; i++) {
        recipients.add(RecipientModel().fromJson(response.data[i]));
      }

      if (recipients.length == 0) {
        recipientWidgetList.add(
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
                    "No recipient found!",
                    style: TextStyle(fontSize: 24.0, fontFamily: Stem.regular),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        for (var recipient in recipients) {
          recipientWidgetList.add(RecipientWidget(recipient: recipient));
        }
      }

      listLoaded = true;
      callSetState();
    } else {
      recipientWidgetList.add(
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

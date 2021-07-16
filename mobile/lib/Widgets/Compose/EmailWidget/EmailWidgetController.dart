import 'package:Ignosia/Common/API.dart';
import 'package:Ignosia/Common/ApiUrl.dart';
import 'package:Ignosia/Common/Common.dart';
import 'package:Ignosia/Common/Stem.dart';
import 'package:Ignosia/Model/ResponseModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:uuid/uuid.dart';

class EmailWidgetController {
  final emailKey = GlobalKey<FormState>();
  TextEditingController emailContentController = new TextEditingController();
  TextEditingController subjectController = new TextEditingController();

  Widget sendEmailBtn = Text(
    'Send email',
    style: TextStyle(fontSize: 18.0, fontFamily: Stem.regular),
  );

  Future<void> sendEmail(BuildContext context, Function callSetState, String id, String emailAddress, String subject, String content) async {
    var uuid = Uuid();
    String messageID = uuid.v1();

    var body = {
      "id": messageID,
      "senderID": Common.loggedInUserData.iD,
      "recipientID": id,
      "timeAndDate": DateTime.now().toString(),
      "emailAddress": emailAddress,
      "subject": subject,
      "content": content,
    };

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.sendEmail), body);

    if (response.success) {
      Alert(
        context: context,
        style: Common.successAlertStyle,
        type: AlertType.success,
        title: "Email sent!",
        desc: response.msg,
        buttons: [
          DialogButton(
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: Stem.regular),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            color: Colors.green,
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
    }
  }
}

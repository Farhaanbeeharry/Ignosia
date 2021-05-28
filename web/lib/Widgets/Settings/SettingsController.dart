import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Encryptor.dart';
import 'package:web/Model/ResponseModel.dart';

class SettingsController {
  final bugKey = GlobalKey<FormState>();
  final userSettingsKey = GlobalKey<FormState>();

  TextEditingController bugController = new TextEditingController();

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  Widget passwordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool passwordObscureTextCheck = true;
  Widget confirmPasswordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool confirmPasswordObscureTextCheck = true;

  Widget bugBtnWidget = Text(
    "Report bug",
    style: Common.buttonTextStyle,
  );
  Widget saveSettingsBtnWidget = Text(
    "Save settings",
    style: Common.buttonTextStyle,
  );

  Future<void> reportBug(String bug, BuildContext context) async {
    var uuid = Uuid();
    String id = uuid.v1();

    String date = Common.getDate();

    var body = {"id": id, "reportedBy": Common.loggedInData.iD, "bug": bug, "date": date};
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.reportBug), body);

    if (response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Bug reported successfully!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "Your bug with id '$id' stating '$bug' has been succesfully reported!",
        btnOkOnPress: () {},
        onDissmissCallback: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to report bug!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }

  Future<void> updateUserSettings(String firstName, String lastName, String password, String location, String emailAddress, BuildContext context) async {
    password = Encrypt().encryptPassword(password); //encrypt password

    emailAddress = emailAddress.toLowerCase();

    var body = {"id": Common.loggedInData.iD, "firstName": firstName, "lastName": lastName, "password": password, "location": location, "emailAddress": emailAddress};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.updateUserData), body);

    if (response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Details updated successfully!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "Hello $firstName, your data has been updated!",
        btnOkOnPress: () {},
        onDissmissCallback: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to update your data!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

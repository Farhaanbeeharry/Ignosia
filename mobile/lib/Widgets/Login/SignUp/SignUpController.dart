import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ignosia/Common/API.dart';
import 'package:ignosia/Common/ApiUrl.dart';
import 'package:ignosia/Common/Common.dart';
import 'package:ignosia/Common/Encryptor.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Model/ResponseModel.dart';
import 'package:ignosia/Model/UserModel.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpController {
  Widget saveBtn = Text(
    "Save",
    style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: Stem.regular),
  );

  Widget passwordObscureTextIcon = Icon(
    FontAwesomeIcons.eye,
    color: Colors.white,
  );
  bool passwordObscureTextCheck = true;

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();

  DateTime dateToday = DateTime.now();
  String selectedDate = 'Date of birth';

  showError(BuildContext context, String text) {
    Alert(
      context: context,
      style: Common.errorAlertStyle,
      type: AlertType.error,
      title: "Validation error",
      desc: text,
      buttons: [
        DialogButton(
          child: Text(
            "Okay",
            style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: Stem.regular),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }

  Future<bool> signUp(BuildContext context) async {
    String password = Encrypt().encryptPassword(passwordController.text); //encrypt password

    var body = {"emailAddress": Common.loggedInUserData.emailAddress, "id": Common.loggedInUserData.iD, "password": password, "location": locationController.text, "dateOfBirth": selectedDate};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.signUp), body);

    if (response.success) {
      Common.loggedInUserData = UserModel().fromJson(response.data);
      return true;
    } else {
      Alert(
        context: context,
        style: Common.errorAlertStyle,
        type: AlertType.error,
        title: "Sign up failed",
        desc: response.error,
        buttons: [
          DialogButton(
            child: Text(
              "Okay",
              style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: Stem.regular),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
            radius: BorderRadius.circular(10.0),
          ),
        ],
      ).show();
      return false;
    }
  }
}

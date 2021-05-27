import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Encryptor.dart';
import 'package:web/Model/ResponseModel.dart';

class SignupController {
  Widget submitBtnWidget = Text("Submit", style: Common.buttonTextStyle);
  Widget passwordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool passwordObscureTextCheck = true;
  Widget confirmPasswordObscureTextIcon = Icon(FontAwesomeIcons.eye);
  bool confirmPasswordObscureTextCheck = true;
  bool agreementBox = false;

  TextEditingController firstNameController = TextEditingController();

  final signUpKey = GlobalKey<FormState>();

  Color agreementColor = Colors.black;
  Color errorAgreement = Colors.red;

  TextEditingController passwordController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();

  DateTime dateToday = DateTime.now();
  String selectedDate = 'Date of birth';

  Future<void> signUp(String firstName, String lastName, String emailAddress, String phoneNumber, String password, String location, String dob, BuildContext context) async {
    password = Encrypt().encryptPassword(password); //encrypt password

    emailAddress = emailAddress.toLowerCase();

    var body = {"firstName": firstName, "lastName": lastName, "emailAddress": emailAddress, "phoneNumber": phoneNumber, "password": password, "address": location, "dob": dob};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.signUp), body);

    if (response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        btnOkColor: Color(0xFF00ca71),
        title: "Registration Successful",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: false,
        desc: response.error,
        btnOkOnPress: () {
          Navigator.pushNamed(context, '/Homepage');
        },
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Registration failed",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

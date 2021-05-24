import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Encryptor.dart';
import 'package:web/Model/ResponseModel.dart';

class MembersController {
  final createMemberKey = GlobalKey<FormState>();

  bool agreementBox = false;
  Color agreementColor = Colors.black;
  Color errorAgreement = Colors.red;

  Widget createMemberBtnWidget = Text(
    "Create member",
    style: Common.buttonTextStyle,
  );

  bool webCheck = true;
  bool mobileCheck = false;
  String selectedAccountType = "web";

  Color disabledCheckBoxContainer = Colors.black12;
  Color disabledCheckBoxText = Colors.grey.shade500;

  Color enabledCheckBoxContainer = Color(0xFF6c63ff);
  Color enabledCheckBoxText = Colors.white;

  TextEditingController emailController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();

  Future<bool> createMember(String emailAddress, String firstName, String lastName, String phoneNumber, String accountType, BuildContext context) async {
    emailAddress = emailAddress.toLowerCase();
    var uuid = Uuid();
    String id = uuid.v1();
    String rawPassword = Generator.generatePassword(PasswordStrength.weak);
    String password = Encrypt().encryptPassword(rawPassword);

    print(rawPassword);
    print(password);

    var body = {"ID": id, "emailAddress": emailAddress, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "password": password, "rawPassword": rawPassword, "accountType": accountType};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.createMember), body);

    if (response.success) {
      AwesomeDialog(context: context, dialogType: DialogType.SUCCES, title: "Member created successfully!", width: MediaQuery.of(context).size.width * 0.4, dismissOnTouchOutside: true, desc: "An email has been sent to the user with the login credentials!", btnOkOnPress: () {}, onDissmissCallback: () {}).show();
      return true;
    } else if (!response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to create member!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
      return false;
    }
  }
}

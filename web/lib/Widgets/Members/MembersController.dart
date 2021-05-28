import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Encryptor.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Model/UserModel.dart';
import 'package:web/Widgets/Members/MemberWidget/MemberWidgetView.dart';

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
  bool hybridCheck = false;
  String selectedAccountType = "web";

  Color disabledCheckBoxContainer = Colors.black12;
  Color disabledCheckBoxText = Colors.grey.shade500;

  Color enabledCheckBoxContainer = Color(0xFF6c63ff);
  Color enabledCheckBoxText = Colors.white;

  TextEditingController emailController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();

  Widget memberListRefreshIcon = Icon(
    FontAwesomeIcons.syncAlt,
    color: Color(0xFF6c63ff),
  );

  Future<bool> createMember(Function callSetState, String emailAddress, String firstName, String lastName, String phoneNumber, String accountType, BuildContext context) async {
    emailAddress = emailAddress.toLowerCase();
    var uuid = Uuid();
    String id = uuid.v1();
    String rawPassword = Generator.generatePassword(PasswordStrength.weak);
    String password = Encrypt().encryptPassword(rawPassword);

    String webUser = selectedAccountType == "web" || selectedAccountType == "hybrid" ? "true" : "false";
    String mobileUser = selectedAccountType == "mobile" || selectedAccountType == "hybrid" ? "true" : "false";

    var body = {"ID": id, "emailAddress": emailAddress, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "password": password, "rawPassword": rawPassword, "webUser": webUser, "mobileUser": mobileUser};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.createMember), body);

    if (response.success) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Member created successfully!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "An email has been sent to the user with the login credentials!",
        btnOkOnPress: () {
          callSetState();
        },
        onDissmissCallback: () {
          callSetState();
        },
      ).show();
      return true;
    } else {
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

  Future<void> getMemberList(Function callSetState) async {
    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getMemberList), {});

    if (response.success) {
      Common.memberWidgetList.clear();

      if (response.data.length == 0) {
        Common.memberWidgetList.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'No members found!',
              style: TextStyle(
                fontFamily: Stem.light,
                color: Color(0xFF9e9e9e),
                fontSize: 18.0,
              ),
            ),
          ],
        ));
      } else {
        Common.memberList.clear();
        for (int i = 0; i < response.data.length; i++) {
          UserModel member = UserModel().fromJson(response.data[i]);
          Common.memberList.add(member);
        }

        UserModel tempUser;
        int indexRef;
        for (int i = 0; i < Common.memberList.length; i++) {
          if (Common.memberList[i].status == "admin") {
            tempUser = Common.memberList[i];
            indexRef = i;
          }
        }

        Common.memberList.removeAt(indexRef);
        Common.memberList.insert(0, tempUser);


        for (var member in Common.memberList) {
          Common.memberWidgetList.add(MemberWidget(memberData: member, callSetState: callSetState));
        }
      }
    } else {
      Common.memberWidgetList.clear();
      Common.memberWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch member list! Click \'Refresh\' to try again.',
            style: TextStyle(
              fontFamily: Stem.light,
              color: Colors.red,
              fontSize: 16.0,
            ),
          ),
        ],
      ));
    }
  }
}

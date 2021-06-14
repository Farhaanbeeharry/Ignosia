import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BeneficiaryModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Beneficiary/BeneficiaryDetailedWidget/BeneficiaryDetailedController.dart';

class BeneficiaryDetailedWidget extends StatefulWidget {
  final BeneficiaryModel data;
  final Function callSetState;
  final Function loadData;
  final BuildContext secondaryContext;

  BeneficiaryDetailedWidget({this.data, this.callSetState, this.loadData, this.secondaryContext});

  @override
  _BeneficiaryDetailedWidgetState createState() => _BeneficiaryDetailedWidgetState();
}

class _BeneficiaryDetailedWidgetState extends State<BeneficiaryDetailedWidget> {
  BeneficiaryDetailedController beneficiaryDetailedController = new BeneficiaryDetailedController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.28,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.data.gender,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                      Text(
                        ' of ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Text(
                        Common.getAge(widget.data.dateOfBirth) + " years old",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'National ID: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Text(
                        widget.data.nationalID,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Date of birth: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Text(
                        widget.data.dateOfBirth[0] + widget.data.dateOfBirth[1] + " " + Common.months[int.parse(widget.data.dateOfBirth[3] + widget.data.dateOfBirth[4]) - 1] + " " + widget.data.dateOfBirth[6] + widget.data.dateOfBirth[7] + widget.data.dateOfBirth[8] + widget.data.dateOfBirth[9],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.location,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.emailAddress,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salary: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.salary == "0" ? "None" : "Rs" + widget.data.salary,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responsible party name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.responsiblePartyName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responsible party relationship: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.responsiblePartyRelationship,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qualification year: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.qualificationYear,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'School: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.school == 'false' ? "None" : widget.data.school,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'University: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.university == 'false' ? "None" : widget.data.university,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skill: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.skill == 'false' ? "None" : widget.data.skill,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work experience: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.workExperience == 'false' ? "None" : widget.data.workExperience,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Working capabilities: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.workingCapabilities == 'false' ? "None" : widget.data.workingCapabilities,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current workplace: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.currentWorkplace == 'false' ? "None" : widget.data.currentWorkplace,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current workplace role: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.currentWorkplaceRole == 'false' ? "None" : widget.data.currentWorkplaceRole,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marital status: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.maritalStatus,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Police record: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.policeRecord == 'false' ? "None" : widget.data.policeRecord,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receives pension: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.receivesPension == 'true' ? "Yes" : "No",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social aid: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.socialAid == 'false' ? "No" : widget.data.socialAid,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home phone: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.homePhone,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile phone: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.mobilePhone,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work from date: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.workFromDate == "false" ? "Has not worked" : widget.data.workFromDate,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work to date: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.workToDate == "false" ? "Has not worked" : widget.data.workToDate,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of children: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.numberOfChildren,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notes: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          widget.data.notes == "false" ? "None" : widget.data.notes,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          sendEmailDialog(widget.data.firstName + ' ' + widget.data.lastName, widget.data.emailAddress, widget.data.iD);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF6c63ff),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          width: 175.0,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidPaperPlane,
                                size: 26.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                child: Text(
                                  "Email",
                                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.medium),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            beneficiaryDetailedController.deleteBtnWidget = SpinKitWave(
                              color: Colors.white,
                              size: 25.0,
                            );
                          });
                          await beneficiaryDetailedController.deleteBeneficiary(widget.data.iD, widget.callSetState, widget.secondaryContext, widget.loadData);
                          setState(() {
                            beneficiaryDetailedController.deleteBtnWidget = Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.trashAlt,
                                  size: 26.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 7.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.medium),
                                  ),
                                ),
                              ],
                            );
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          width: 175.0,
                          height: 50.0,
                          child: beneficiaryDetailedController.deleteBtnWidget,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> sendEmailDialog(String name, String emailAddress, String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return EmailWidget(name: name, emailAddress: emailAddress, id: id);
      },
    );
  }
}

class EmailWidget extends StatefulWidget {
  final String name;
  final String emailAddress;
  final String id;

  EmailWidget({this.name, this.emailAddress, this.id});
  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  TextEditingController subjectController = new TextEditingController();
  TextEditingController emailContentController = new TextEditingController();
  final emailKey = GlobalKey<FormState>();
  Widget sendEmailBtnWidget = Text(
    "Send email",
    style: Common.buttonTextStyle,
  );

  Future<void> sendEmailWithSubject(String name, String emailAddress, String subject, String content, String id) async {
    var uuid = Uuid();
    String id = uuid.v1();

    var body = {
      "id": id,
      "senderID": Common.loggedInData.iD,
      "recipientID": Common.loggedInData.iD,
      "timeAndDate": DateTime.now().toString(),
      "subject": subject,
      "content": content,
      "emailAddress": emailAddress,
    };

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.sendEmailWithSubject), body);

    if (response.success) {
      setState(() {
        emailSent = true;
        emailSuccessful = true;
      });
    } else {
      emailSent = true;
      emailSuccessful = false;
    }
  }

  bool emailSent = false;
  bool emailSuccessful = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 500.0,
              width: 1200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: emailSent
                  ? (emailSuccessful
                      ? Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/mailSent.svg",
                                width: 300.0,
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                'Email sent successfully!',
                                style: TextStyle(fontSize: 42.0, color: Colors.green, fontFamily: Stem.bold),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 50.0,
                                width: 250.0,
                                child: TextButton(
                                  onPressed: () {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                  child: Text(
                                    "Close",
                                    style: Common.buttonTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/mailFail.svg",
                                width: 300.0,
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              Text(
                                'Failed to send email!',
                                style: TextStyle(fontSize: 42.0, color: Colors.red, fontFamily: Stem.bold),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 50.0,
                                width: 250.0,
                                child: TextButton(
                                  onPressed: () {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                  child: Text(
                                    "Close",
                                    style: Common.buttonTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/email.svg",
                          width: 300.0,
                        ),
                        SizedBox(
                          width: 125.0,
                        ),
                        Container(
                          width: 500.0,
                          child: Form(
                            key: emailKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Send email',
                                  style: TextStyle(fontSize: 54.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'To: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      widget.emailAddress,
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                    ),
                                    Text(
                                      ' (${widget.name})',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Container(
                                  height: 235.0,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          validator: (subject) {
                                            if (subject.isEmpty) {
                                              return "Subject cannot be empty!";
                                            }
                                            return null;
                                          },
                                          controller: subjectController,
                                          style: Common.labelTextStyle,
                                          decoration: InputDecoration(
                                            border: new OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(15.0),
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.only(top: 50.0),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                              child: Icon(FontAwesomeIcons.heading),
                                            ),
                                            labelText: 'Subject',
                                            labelStyle: Common.labelTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        TextFormField(
                                          validator: (emailContent) {
                                            if (emailContent.isEmpty) {
                                              return "Email content cannot be empty!";
                                            }
                                            return null;
                                          },
                                          controller: emailContentController,
                                          style: Common.labelTextStyle,
                                          decoration: InputDecoration(
                                            border: new OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(
                                                const Radius.circular(15.0),
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.only(top: 50.0),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                              child: Icon(FontAwesomeIcons.commentAlt),
                                            ),
                                            labelText: 'Email content',
                                            labelStyle: Common.labelTextStyle,
                                          ),
                                          minLines: 5,
                                          maxLines: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 340.0,
                                      child: TextButton(
                                        onPressed: () async {
                                          FocusScope.of(context).requestFocus(new FocusNode());

                                          if (emailKey.currentState.validate()) {
                                            setState(() {
                                              sendEmailBtnWidget = SpinKitWave(
                                                color: Colors.white,
                                                size: 25.0,
                                              );
                                            });
                                            await sendEmailWithSubject(widget.name, widget.emailAddress, subjectController.text, emailContentController.text, widget.id);
                                            setState(() {
                                              sendEmailBtnWidget = Text(
                                                "Send email",
                                                style: Common.buttonTextStyle,
                                              );
                                            });
                                          }
                                        },
                                        style: TextButton.styleFrom(backgroundColor: Color(0xFF6c63ff), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                        child: sendEmailBtnWidget,
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 50.0,
                                      width: 150.0,
                                      child: TextButton(
                                        onPressed: () {
                                          FocusScope.of(context).requestFocus(new FocusNode());
                                          Navigator.pop(context);
                                        },
                                        style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                        child: Text(
                                          "Close",
                                          style: Common.buttonTextStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BeneficiaryModel.dart';
import 'package:web/Widgets/Validator/BeneficiaryValidator/BeneficiaryValidatorController.dart';

class BeneficiaryValidatorView extends StatefulWidget {
  final BeneficiaryModel data;
  final Function callSetState;

  final BuildContext secondaryContext;
  final Function callValidatorSetState;
  BeneficiaryValidatorView({this.data, this.callSetState, this.secondaryContext, this.callValidatorSetState});

  @override
  _BeneficiaryValidatorViewState createState() => _BeneficiaryValidatorViewState();
}

class _BeneficiaryValidatorViewState extends State<BeneficiaryValidatorView> {
  BeneficiaryValidatorController beneficiaryValidatorController = new BeneficiaryValidatorController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.0,
        ),
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
                  Text(
                    widget.data.firstName + " " + widget.data.lastName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontFamily: Stem.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
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
                          widget.data.school,
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
                          widget.data.university,
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
                          widget.data.skill,
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
                          widget.data.workExperience,
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
                          widget.data.workingCapabilities,
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
                          widget.data.currentWorkplace,
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
                          widget.data.currentWorkplaceRole,
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
                          widget.data.workFromDate == "" ? "Has not worked" : widget.data.workFromDate,
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
                          widget.data.workToDate == "" ? "Has not worked" : widget.data.workToDate,
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
                          widget.data.notes == "" ? "None" : widget.data.notes,
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
                        onTap: () async {
                          setState(() {
                            beneficiaryValidatorController.validateBtn = SpinKitWave(
                              color: Colors.white,
                              size: 25.0,
                            );
                          });
                          await beneficiaryValidatorController.validateBeneficiary(widget.data.iD, widget.callSetState, widget.secondaryContext, widget.callValidatorSetState);
                          setState(() {
                            beneficiaryValidatorController.validateBtn = Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.checkCircle,
                                  size: 26.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 7.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                  child: Text(
                                    "Validate",
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
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          width: 175.0,
                          height: 50.0,
                          child: beneficiaryValidatorController.validateBtn,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            beneficiaryValidatorController.rejectBtn = SpinKitWave(
                              color: Colors.white,
                              size: 25.0,
                            );
                          });
                          await beneficiaryValidatorController.rejectBeneficiary(widget.data.iD, widget.callSetState, widget.secondaryContext, widget.callValidatorSetState);
                          setState(() {
                            beneficiaryValidatorController.rejectBtn = Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.timesCircle,
                                  size: 26.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 7.5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                  child: Text(
                                    "Reject",
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
                          child: beneficiaryValidatorController.rejectBtn,
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
}

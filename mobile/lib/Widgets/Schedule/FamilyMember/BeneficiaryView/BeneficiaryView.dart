import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/BeneficiaryModel.dart';
import 'package:mobile/Widgets/Schedule/FamilyMember/BeneficiaryView/BeneficiaryController.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:validators/validators.dart';
import 'package:xlive_switch/xlive_switch.dart';

class BeneficiaryView extends StatefulWidget {
  final BeneficiaryModel beneficiary;
  final Function loadData;

  BeneficiaryView({this.beneficiary, this.loadData});

  @override
  _BeneficiaryViewState createState() => _BeneficiaryViewState();
}

class _BeneficiaryViewState extends State<BeneficiaryView> {
  BeneficiaryController beneficiaryController = new BeneficiaryController();

  callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  initialise() {
    setState(() {
      //basic details
      if (widget.beneficiary.firstName == "New") {
        // beneficiaryController.firstNameController.text = "First name";
      } else {
        beneficiaryController.firstNameController.text = widget.beneficiary.firstName;
      }
      if (widget.beneficiary.lastName == "family member") {
        // beneficiaryController.lastNameController.text = "Last name";
      } else {
        beneficiaryController.lastNameController.text = widget.beneficiary.lastName;
      }

      if (widget.beneficiary.gender == "Male") {
        beneficiaryController.maleChecked = true;
        beneficiaryController.femaleChecked = false;
        beneficiaryController.otherGenderChecked = false;
      } else if (widget.beneficiary.gender == "Female") {
        beneficiaryController.maleChecked = false;
        beneficiaryController.femaleChecked = true;
        beneficiaryController.otherGenderChecked = false;
      } else if (widget.beneficiary.gender == "Unspecified Gender") {
        beneficiaryController.maleChecked = false;
        beneficiaryController.femaleChecked = false;
        beneficiaryController.otherGenderChecked = true;
      }

      if (widget.beneficiary.nationalID == "null") {
        // beneficiaryController.nationalIDController.text = "National ID";
      } else {
        beneficiaryController.nationalIDController.text = widget.beneficiary.nationalID;
      }

      if (widget.beneficiary.dateOfBirth == "null") {
        beneficiaryController.selectedDate = 'Date of birth';
      } else {
        beneficiaryController.selectedDate = widget.beneficiary.dateOfBirth;
      }

      //Contact details

      if (widget.beneficiary.homePhone == "null") {
        // beneficiaryController.homePhoneController.text = "Home phone number";
      } else {
        beneficiaryController.homePhoneController.text = widget.beneficiary.homePhone;
      }

      if (widget.beneficiary.mobilePhone == "null") {
        // beneficiaryController.mobilePhoneController.text = "Mobile phone number";
      } else {
        beneficiaryController.mobilePhoneController.text = widget.beneficiary.mobilePhone;
      }

      if (widget.beneficiary.emailAddress == "null") {
        // beneficiaryController.emailController.text = "Email address";
      } else {
        beneficiaryController.emailController.text = widget.beneficiary.emailAddress;
      }

      if (widget.beneficiary.location == "null") {
        // beneficiaryController.locationController.text = "Location";
      } else {
        beneficiaryController.locationController.text = widget.beneficiary.location;
      }

      if (widget.beneficiary.latitude == "null") {
        beneficiaryController.latitudeController.text = "Latitude";
      } else {
        beneficiaryController.latitudeController.text = double.parse(widget.beneficiary.latitude).toStringAsFixed(2);
      }

      if (widget.beneficiary.longitude == "null") {
        beneficiaryController.longitudeController.text = "Longitude";
      } else {
        beneficiaryController.longitudeController.text = double.parse(widget.beneficiary.longitude).toStringAsFixed(2);
      }

      //Education

      if (widget.beneficiary.school == "null") {
        // beneficiaryController.schoolController.text = "School";
      } else {
        beneficiaryController.schoolController.text = widget.beneficiary.school;
      }

      if (widget.beneficiary.university == "null") {
        // beneficiaryController.universityController.text = "University";
      } else {
        beneficiaryController.universityController.text = widget.beneficiary.university;
      }

      if (widget.beneficiary.qualificationYear == "null") {
        // beneficiaryController.qualificationYearController.text = "Qualification year";
      } else {
        beneficiaryController.qualificationYearController.text = widget.beneficiary.qualificationYear;
      }

      //Work experience
      if (widget.beneficiary.workExperience == "null") {
        // beneficiaryController.workExperienceController.text = "Work experience";
      } else {
        beneficiaryController.workExperienceController.text = widget.beneficiary.workExperience;
      }

      if (widget.beneficiary.workingCapabilities == "null") {
        // beneficiaryController.workingCapabilitiesController.text = "Working capabilities";
      } else {
        beneficiaryController.workingCapabilitiesController.text = widget.beneficiary.workingCapabilities;
      }

      if (widget.beneficiary.workFromDate == "null") {
        // beneficiaryController.workFromDateController.text = "Work from date";
      } else {
        beneficiaryController.workFromDateController.text = widget.beneficiary.workFromDate;
      }

      if (widget.beneficiary.workToDate == "null") {
        // beneficiaryController.workToDateController.text = "Work to date";
      } else {
        beneficiaryController.workToDateController.text = widget.beneficiary.workToDate;
      }
      if (widget.beneficiary.currentWorkplace == "null") {
        // beneficiaryController.currentWorkplaceController.text = "Current workplace";
      } else {
        beneficiaryController.currentWorkplaceController.text = widget.beneficiary.currentWorkplace;
      }

      if (widget.beneficiary.currentWorkplaceRole == "null") {
        // beneficiaryController.currentWorkplaceRoleController.text = "Current workplace role";
      } else {
        beneficiaryController.currentWorkplaceRoleController.text = widget.beneficiary.currentWorkplaceRole;
      }

      if (widget.beneficiary.salary == "null") {
        // beneficiaryController.salaryController.text = "Salary (Rs)";
      } else {
        beneficiaryController.salaryController.text = widget.beneficiary.salary;
      }

      //Relationship

      if (widget.beneficiary.responsiblePartyName == "null") {
        // beneficiaryController.responsiblePartyNameController.text = "Responsible party name";
      } else {
        beneficiaryController.responsiblePartyNameController.text = widget.beneficiary.responsiblePartyName;
      }

      if (widget.beneficiary.responsiblePartyRelationship == "null") {
        // beneficiaryController.responsiblePartyRelationshipController.text = "Responsible party relationship";
      } else {
        beneficiaryController.responsiblePartyRelationshipController.text = widget.beneficiary.responsiblePartyRelationship;
      }

      if (widget.beneficiary.maritalStatus == "null") {
        // beneficiaryController.maritalStatusController.text = "Marital status";
      } else {
        beneficiaryController.maritalStatusController.text = widget.beneficiary.maritalStatus;
      }

      if (widget.beneficiary.numberOfChildren == "null") {
        // beneficiaryController.numberOfChildrenController.text = "Number of children";
      } else {
        beneficiaryController.numberOfChildrenController.text = widget.beneficiary.numberOfChildren;
      }

      //other details

      if (widget.beneficiary.skill == "null") {
        // beneficiaryController.skillsController.text = "Skill(s)";
      } else {
        beneficiaryController.skillsController.text = widget.beneficiary.skill;
      }

      if (widget.beneficiary.policeRecord == 'true') {
        beneficiaryController.policeRecordValue = true;
      } else
        beneficiaryController.policeRecordValue = false;

      if (widget.beneficiary.receivesPension == 'true') {
        beneficiaryController.receivesPensionValue = true;
      } else
        beneficiaryController.receivesPensionValue = false;

      if (widget.beneficiary.socialAid == 'true') {
        beneficiaryController.socialAidValue = true;
      } else
        beneficiaryController.socialAidValue = false;

      //Notes

      if (widget.beneficiary.notes == "null") {
        // beneficiaryController.notesController.text = "Notes";
      } else {
        beneficiaryController.notesController.text = widget.beneficiary.notes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF009a8c),
          toolbarHeight: 70.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Center(
              child: Text(
                widget.beneficiary.firstName + " " + widget.beneficiary.lastName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, fontFamily: Stem.medium, color: Colors.white),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: SingleChildScrollView(
                      controller: beneficiaryController.scrollController,
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Color(0xff32ada2),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: beneficiaryController.basicDetailsHeight,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Basic Details',
                                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (beneficiaryController.basicDetailsVisibility) {
                                              setState(() {
                                                beneficiaryController.basicDetailsVisibility = !beneficiaryController.basicDetailsVisibility;
                                                beneficiaryController.basicDetailsHeight = beneficiaryController.defaultHeight;
                                                beneficiaryController.basicDetailsBtn = beneficiaryController.chevronDown;
                                              });
                                              beneficiaryController.animateToPosition(0);
                                            } else {
                                              setState(() {
                                                beneficiaryController.basicDetailsHeight = beneficiaryController.basicDetailsMaxHeight;
                                                beneficiaryController.basicDetailsBtn = beneficiaryController.chevronUp;
                                              });

                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.basicDetailsVisibility = !beneficiaryController.basicDetailsVisibility;
                                              });
                                              beneficiaryController.animateToPosition(0);
                                            }
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xff35d7b4),
                                            ),
                                            child: beneficiaryController.basicDetailsBtn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible: beneficiaryController.basicDetailsVisibility,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.firstNameController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "First name",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.lastNameController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Last name",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (!beneficiaryController.maleChecked) {
                                                    setState(() {
                                                      beneficiaryController.maleChecked = true;
                                                      beneficiaryController.femaleChecked = false;
                                                      beneficiaryController.otherGenderChecked = false;
                                                      beneficiaryController.selectedGender = "Male";
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: beneficiaryController.maleChecked ? beneficiaryController.selectedGenderBGColor : beneficiaryController.unselectedGenderBGColor,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons.mars,
                                                        color: beneficiaryController.maleChecked ? beneficiaryController.selectedGenderTextColor : beneficiaryController.unselectedGenderTextColor,
                                                        size: 42.0,
                                                      ),
                                                      SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        'Male',
                                                        style: TextStyle(color: beneficiaryController.maleChecked ? beneficiaryController.selectedGenderTextColor : beneficiaryController.unselectedGenderTextColor, fontSize: 18.0, fontFamily: Stem.medium),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (!beneficiaryController.femaleChecked) {
                                                    setState(() {
                                                      beneficiaryController.maleChecked = false;
                                                      beneficiaryController.femaleChecked = true;
                                                      beneficiaryController.otherGenderChecked = false;
                                                      beneficiaryController.selectedGender = "Female";
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: beneficiaryController.femaleChecked ? beneficiaryController.selectedGenderBGColor : beneficiaryController.unselectedGenderBGColor,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons.venus,
                                                        color: beneficiaryController.femaleChecked ? beneficiaryController.selectedGenderTextColor : beneficiaryController.unselectedGenderTextColor,
                                                        size: 42.0,
                                                      ),
                                                      SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        'Female',
                                                        style: TextStyle(color: beneficiaryController.femaleChecked ? beneficiaryController.selectedGenderTextColor : beneficiaryController.unselectedGenderTextColor, fontSize: 18.0, fontFamily: Stem.medium),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (!beneficiaryController.otherGenderChecked) {
                                                    setState(() {
                                                      beneficiaryController.maleChecked = false;
                                                      beneficiaryController.femaleChecked = false;
                                                      beneficiaryController.otherGenderChecked = true;
                                                      beneficiaryController.selectedGender = "Unspecified Gender";
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: beneficiaryController.otherGenderChecked ? beneficiaryController.selectedGenderBGColor : beneficiaryController.unselectedGenderBGColor,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons.transgenderAlt,
                                                        color: beneficiaryController.otherGenderChecked ? beneficiaryController.selectedGenderTextColor : beneficiaryController.unselectedGenderTextColor,
                                                        size: 42.0,
                                                      ),
                                                      SizedBox(
                                                        height: 5.0,
                                                      ),
                                                      Text(
                                                        'Other',
                                                        style: TextStyle(color: beneficiaryController.otherGenderChecked ? beneficiaryController.selectedGenderTextColor : beneficiaryController.unselectedGenderTextColor, fontSize: 18.0, fontFamily: Stem.medium),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.nationalIDController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "National ID",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: (MediaQuery.of(context).size.width * 0.75) - 60,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  color: Color(0xffb0ffee),
                                                ),
                                                child: TextFormField(
                                                  enabled: false,
                                                  validator: (date) {
                                                    if (beneficiaryController.selectedDate == "Date of birth") {
                                                      return "Select your date of birth!";
                                                    }
                                                    return null;
                                                  },
                                                  style: Common.labelTextStyle,
                                                  decoration: InputDecoration(
                                                    errorStyle: TextStyle(
                                                      color: Theme.of(context).errorColor, // or any other color
                                                    ),
                                                    contentPadding: EdgeInsets.only(left: 20, top: 50.0),
                                                    labelText: beneficiaryController.selectedDate,
                                                    labelStyle: TextStyle(color: Colors.black),
                                                    border: new OutlineInputBorder(
                                                      borderRadius: const BorderRadius.only(
                                                        topLeft: Radius.circular(15.0),
                                                        bottomLeft: Radius.circular(15.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              InkWell(
                                                onTap: () async {
                                                  FocusScope.of(context).requestFocus(new FocusNode());

                                                  final DateTime picked = await showDatePicker(
                                                    context: context,
                                                    initialDate: beneficiaryController.dateToday, // Refer step 1
                                                    firstDate: DateTime(1920),
                                                    lastDate: DateTime.now(),
                                                  );
                                                  String dateRAW;
                                                  if (picked != null && picked.toString() != beneficiaryController.selectedDate) {
                                                    dateRAW = picked.toString();
                                                    String displayDate = dateRAW[8] + dateRAW[9] + "/" + dateRAW[5] + dateRAW[6] + "/" + dateRAW[0] + dateRAW[1] + dateRAW[2] + dateRAW[3];

                                                    beneficiaryController.selectedDate = displayDate;

                                                    setState(() {
                                                      beneficiaryController.selectedDate = displayDate;
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: 50,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: Color(0xff35d7b4),
                                                  ),
                                                  child: Icon(
                                                    FontAwesomeIcons.calendarAlt,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Color(0xff32ada2),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: beneficiaryController.contactDetailsHeight,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Contact Details',
                                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (beneficiaryController.contactDetailsVisibility) {
                                              setState(() {
                                                beneficiaryController.contactDetailsVisibility = !beneficiaryController.contactDetailsVisibility;
                                                beneficiaryController.contactDetailsHeight = beneficiaryController.defaultHeight;
                                                beneficiaryController.contactDetailsBtn = beneficiaryController.chevronDown;
                                              });
                                              beneficiaryController.animateToPosition(0);
                                            } else {
                                              setState(() {
                                                beneficiaryController.contactDetailsHeight = beneficiaryController.contactDetailsMaxHeight;
                                                beneficiaryController.contactDetailsBtn = beneficiaryController.chevronUp;
                                              });

                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.contactDetailsVisibility = !beneficiaryController.contactDetailsVisibility;
                                              });
                                              beneficiaryController.animateToPosition(1);
                                            }
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xff35d7b4),
                                            ),
                                            child: beneficiaryController.contactDetailsBtn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible: beneficiaryController.contactDetailsVisibility,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.homePhoneController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Home phone number",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.mobilePhoneController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Mobile phone number",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.emailController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Email address",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.locationController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Location",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 0.75 / 2) - 35,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: Color(0xffb0ffee),
                                                  ),
                                                  child: TextFormField(
                                                    cursorColor: Colors.black,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: Stem.regular,
                                                    ),
                                                    controller: beneficiaryController.latitudeController,
                                                    enabled: false,
                                                    decoration: new InputDecoration(
                                                      border: InputBorder.none,
                                                      focusedBorder: InputBorder.none,
                                                      enabledBorder: InputBorder.none,
                                                      errorBorder: InputBorder.none,
                                                      disabledBorder: InputBorder.none,
                                                      contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                      hintText: "Latitude",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: Stem.regular,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: (MediaQuery.of(context).size.width * 0.75 / 2) - 35,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                    color: Color(0xffb0ffee),
                                                  ),
                                                  child: TextFormField(
                                                    cursorColor: Colors.black,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: Stem.regular,
                                                    ),
                                                    controller: beneficiaryController.longitudeController,
                                                    enabled: false,
                                                    decoration: new InputDecoration(
                                                      border: InputBorder.none,
                                                      focusedBorder: InputBorder.none,
                                                      enabledBorder: InputBorder.none,
                                                      errorBorder: InputBorder.none,
                                                      disabledBorder: InputBorder.none,
                                                      contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                      hintText: "Longitude",
                                                      hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: Stem.regular,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () async {
                                                    await beneficiaryController.getCurrentLocation(callSetState);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      color: Color(0xff35d7b4),
                                                    ),
                                                    width: 50,
                                                    height: 50.0,
                                                    child: Icon(
                                                      Icons.my_location,
                                                      color: Colors.white,
                                                      size: 26.0,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Color(0xff32ada2),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: beneficiaryController.educationHeight,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Education',
                                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (beneficiaryController.educationVisibility) {
                                              setState(() {
                                                beneficiaryController.educationVisibility = !beneficiaryController.educationVisibility;
                                                beneficiaryController.educationHeight = beneficiaryController.defaultHeight;
                                                beneficiaryController.educationBtn = beneficiaryController.chevronDown;
                                              });
                                              beneficiaryController.animateToPosition(1);
                                            } else {
                                              setState(() {
                                                beneficiaryController.educationHeight = beneficiaryController.educationMaxHeight;
                                                beneficiaryController.educationBtn = beneficiaryController.chevronUp;
                                              });
                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.educationVisibility = !beneficiaryController.educationVisibility;
                                              });
                                              beneficiaryController.animateToPosition(2);
                                            }
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xff35d7b4),
                                            ),
                                            child: beneficiaryController.educationBtn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible: beneficiaryController.educationVisibility,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.schoolController,
                                              minLines: 2,
                                              maxLines: 2,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "School",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.universityController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "University",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.qualificationYearController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Qualification year",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Color(0xff32ada2),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: beneficiaryController.workExperienceHeight,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Work Experience',
                                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (beneficiaryController.workExperienceVisibility) {
                                              setState(() {
                                                beneficiaryController.workExperienceVisibility = !beneficiaryController.workExperienceVisibility;
                                                beneficiaryController.workExperienceHeight = beneficiaryController.defaultHeight;
                                                beneficiaryController.workExperienceBtn = beneficiaryController.chevronDown;
                                              });
                                              beneficiaryController.animateToPosition(2);
                                            } else {
                                              setState(() {
                                                beneficiaryController.workExperienceHeight = beneficiaryController.workExperienceMaxHeight;
                                                beneficiaryController.workExperienceBtn = beneficiaryController.chevronUp;
                                              });
                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.workExperienceVisibility = !beneficiaryController.workExperienceVisibility;
                                              });
                                              beneficiaryController.animateToPosition(3);
                                            }
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xff35d7b4),
                                            ),
                                            child: beneficiaryController.workExperienceBtn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible: beneficiaryController.workExperienceVisibility,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.workExperienceController,
                                              minLines: 2,
                                              maxLines: 2,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Work experience",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.workingCapabilitiesController,
                                              minLines: 2,
                                              maxLines: 2,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Working capabilities",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.workFromDateController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Work from date",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.workToDateController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Work to date",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.currentWorkplaceController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Current workplace",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.currentWorkplaceRoleController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Current workplace role",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.salaryController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Salary (Rs)",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Color(0xff32ada2),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: beneficiaryController.relationshipHeight,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Relationship',
                                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (beneficiaryController.relationshipVisibility) {
                                              setState(() {
                                                beneficiaryController.relationshipVisibility = !beneficiaryController.relationshipVisibility;
                                                beneficiaryController.relationshipHeight = beneficiaryController.defaultHeight;
                                                beneficiaryController.relationshipBtn = beneficiaryController.chevronDown;
                                              });
                                              beneficiaryController.animateToPosition(3);
                                            } else {
                                              setState(() {
                                                beneficiaryController.relationshipHeight = beneficiaryController.relationshipMaxHeight;
                                                beneficiaryController.relationshipBtn = beneficiaryController.chevronUp;
                                              });
                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.relationshipVisibility = !beneficiaryController.relationshipVisibility;
                                              });
                                              beneficiaryController.animateToPosition(4);
                                            }
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xff35d7b4),
                                            ),
                                            child: beneficiaryController.relationshipBtn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible: beneficiaryController.relationshipVisibility,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.responsiblePartyNameController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Responsible party name",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.responsiblePartyRelationshipController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Responsible party relationship",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.maritalStatusController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Marital status",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.numberOfChildrenController,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Number of children",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Color(0xff32ada2),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: beneficiaryController.otherDetailsHeight,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Other Details',
                                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (beneficiaryController.otherDetailsVisibility) {
                                              setState(() {
                                                beneficiaryController.otherDetailsVisibility = !beneficiaryController.otherDetailsVisibility;
                                                beneficiaryController.otherDetailsHeight = beneficiaryController.defaultHeight;
                                                beneficiaryController.otherDetailsBtn = beneficiaryController.chevronDown;
                                              });
                                              beneficiaryController.animateToPosition(4);
                                            } else {
                                              setState(() {
                                                beneficiaryController.otherDetailsHeight = beneficiaryController.otherDetailsMaxHeight;
                                                beneficiaryController.otherDetailsBtn = beneficiaryController.chevronUp;
                                              });

                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.otherDetailsVisibility = !beneficiaryController.otherDetailsVisibility;
                                              });
                                              beneficiaryController.animateToPosition(5);
                                            }
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xff35d7b4),
                                            ),
                                            child: beneficiaryController.otherDetailsBtn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible: beneficiaryController.otherDetailsVisibility,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 25.0,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.75,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xffb0ffee),
                                            ),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                              controller: beneficiaryController.skillsController,
                                              minLines: 3,
                                              maxLines: 3,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Skill(s)",
                                                hintStyle: TextStyle(
                                                  color: Colors.black54,
                                                  fontFamily: Stem.regular,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 95.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(12.0),
                                                    ),
                                                    color: Color(0xffb0ffee),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Police Record',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: Stem.regular),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      XlivSwitch(
                                                          value: beneficiaryController.policeRecordValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              beneficiaryController.policeRecordValue = value;
                                                            });
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 95.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(12.0),
                                                    ),
                                                    color: Color(0xffb0ffee),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Receives Pension',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: Stem.regular),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      XlivSwitch(
                                                          value: beneficiaryController.receivesPensionValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              beneficiaryController.receivesPensionValue = value;
                                                            });
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  width: 95.0,
                                                  height: 130.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(12.0),
                                                    ),
                                                    color: Color(0xffb0ffee),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        'Social\nAid',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: Stem.regular),
                                                      ),
                                                      SizedBox(
                                                        height: 10.0,
                                                      ),
                                                      XlivSwitch(
                                                          value: beneficiaryController.socialAidValue,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              beneficiaryController.socialAidValue = value;
                                                            });
                                                          }),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Color(0xff32ada2),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: beneficiaryController.notesHeight,
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            'Notes',
                                            style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            if (beneficiaryController.notesVisibility) {
                                              setState(() {
                                                beneficiaryController.notesVisibility = !beneficiaryController.notesVisibility;
                                                beneficiaryController.notesHeight = beneficiaryController.defaultHeight;
                                                beneficiaryController.notesBtn = beneficiaryController.chevronDown;
                                              });
                                              beneficiaryController.animateToPosition(5);
                                            } else {
                                              setState(() {
                                                beneficiaryController.notesHeight = beneficiaryController.notesMaxHeight;
                                                beneficiaryController.notesBtn = beneficiaryController.chevronUp;
                                              });
                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.notesVisibility = !beneficiaryController.notesVisibility;
                                              });
                                              beneficiaryController.animateToPosition(6);
                                            }
                                          },
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xff35d7b4),
                                            ),
                                            child: beneficiaryController.notesBtn,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: beneficiaryController.notesVisibility,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 25.0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.75,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            color: Color(0xffb0ffee),
                                          ),
                                          child: TextFormField(
                                            cursorColor: Colors.black,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: Stem.regular,
                                            ),
                                            controller: beneficiaryController.notesController,
                                            minLines: 10,
                                            maxLines: 10,
                                            decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                              hintText: "Notes",
                                              hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontFamily: Stem.regular,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 75.0,
                  child: Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          await widget.loadData();
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 85.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFff8a47),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(
                              FontAwesomeIcons.caretLeft,
                              size: 36.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            beneficiaryController.saveBtnWidget = SpinKitWave(
                              color: Colors.white,
                              size: 24.0,
                            );
                          });
                          if (beneficiaryController.firstNameController.text.isEmpty) {
                            beneficiaryController.showError(context, "First name cannot be empty!");
                          } else if (beneficiaryController.firstNameController.text.length > 32) {
                            beneficiaryController.showError(context, "First name is too long!");
                          } else if (beneficiaryController.lastNameController.text.isEmpty) {
                            beneficiaryController.showError(context, "Last name cannot be empty!");
                          } else if (beneficiaryController.lastNameController.text.length > 32) {
                            beneficiaryController.showError(context, "Last name is too long!");
                          } else if (beneficiaryController.nationalIDController.text.isEmpty) {
                            beneficiaryController.showError(context, "National ID cannot be empty!");
                          } else if (beneficiaryController.nationalIDController.text.length != 14) {
                            beneficiaryController.showError(context, "National ID length error!");
                          } else if (beneficiaryController.homePhoneController.text.isEmpty) {
                            beneficiaryController.showError(context, "Home phone number cannot be empty!");
                          } else if (beneficiaryController.homePhoneController.text.length != 7) {
                            beneficiaryController.showError(context, "Home phone number length error!");
                          } else if (beneficiaryController.mobilePhoneController.text.isEmpty) {
                            beneficiaryController.showError(context, "Mobile phone number cannot be empty!");
                          } else if (beneficiaryController.mobilePhoneController.text.length != 8) {
                            beneficiaryController.showError(context, "Mobile phone number length error!");
                          } else if (beneficiaryController.selectedDate == "Date of birth") {
                            beneficiaryController.showError(context, "Select a date of birth!");
                          } else if (!isEmail(beneficiaryController.emailController.text)) {
                            beneficiaryController.showError(context, "Invalid email address!");
                          } else {
                            await beneficiaryController.saveBeneficiaryData(widget.beneficiary.iD, widget.loadData, context);
                          }
                          setState(() {
                            beneficiaryController.saveBtnWidget = Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.solidSave,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                                SizedBox(
                                  width: 15.00,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0, right: 5.0),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(color: Colors.white, fontFamily: Stem.medium, fontSize: 24.0),
                                  ),
                                )
                              ],
                            );
                          });
                        },
                        child: Container(
                          width: 150.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF009a8c),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          child: beneficiaryController.saveBtnWidget,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () async {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "Delete",
                            desc: "Are you sure you want to delete beneficiary ${widget.beneficiary.firstName} ${widget.beneficiary.lastName}?",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "No",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                color: Colors.red,
                              ),
                              DialogButton(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  setState(() {
                                    beneficiaryController.deleteBtnWidget = SpinKitWave(
                                      color: Colors.white,
                                      size: 24.0,
                                    );
                                  });
                                  if (await beneficiaryController.deleteBeneficiary(widget.beneficiary.iD, widget.loadData)) {
                                    widget.loadData();
                                    Navigator.pop(context);
                                  } else {
                                    Alert(
                                      context: context,
                                      style: Common.errorAlertStyle,
                                      type: AlertType.error,
                                      title: "Delete failed",
                                      desc: "Failed to delete beneficiary!",
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
                                },
                                color: Colors.green,
                              )
                            ],
                          ).show();
                        },
                        child: Container(
                          width: 85.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFfc6170),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10.0,
                              ),
                            ),
                          ),
                          child: beneficiaryController.deleteBtnWidget,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

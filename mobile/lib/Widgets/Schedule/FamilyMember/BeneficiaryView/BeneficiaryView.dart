import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/BeneficiaryModel.dart';
import 'package:mobile/Widgets/Schedule/FamilyMember/BeneficiaryView/BeneficiaryController.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BeneficiaryView extends StatefulWidget {
  final BeneficiaryModel beneficiary;
  final Function loadData;

  BeneficiaryView({this.beneficiary, this.loadData});

  @override
  _BeneficiaryViewState createState() => _BeneficiaryViewState();
}

class _BeneficiaryViewState extends State<BeneficiaryView> {
  BeneficiaryController beneficiaryController = new BeneficiaryController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  initialise() {
    setState(() {
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
      if (widget.beneficiary.dateOfBirth == "null") {
        beneficiaryController.selectedDate = 'Date of birth';
      } else {
        beneficiaryController.selectedDate = widget.beneficiary.dateOfBirth;
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
                                            } else {
                                              setState(() {
                                                beneficiaryController.basicDetailsHeight = beneficiaryController.basicDetailsMaxHeight;
                                                beneficiaryController.basicDetailsBtn = beneficiaryController.chevronUp;
                                              });

                                              await Future.delayed(Duration(milliseconds: 200));
                                              setState(() {
                                                beneficiaryController.basicDetailsVisibility = !beneficiaryController.basicDetailsVisibility;
                                              });
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
                                              initialValue: widget.beneficiary.firstName == "New" ? "" : widget.beneficiary.firstName,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "First name",
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
                                              initialValue: widget.beneficiary.lastName == "family member" ? "" : widget.beneficiary.lastName,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "Last name",
                                                hintStyle: TextStyle(
                                                  color: Colors.black,
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
                                              initialValue: widget.beneficiary.nationalID == "null" ? "" : widget.beneficiary.nationalID,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder: InputBorder.none,
                                                contentPadding: EdgeInsets.only(left: 20, bottom: 11, top: 11, right: 15),
                                                hintText: "National ID",
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
                      Container(
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
                        child: Row(
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

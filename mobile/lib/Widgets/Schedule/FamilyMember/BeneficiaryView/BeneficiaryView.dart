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
                                              Container(
                                                width: 80.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  color: beneficiaryController.maleBGColor,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons.mars,
                                                      color: beneficiaryController.maleTextColor,
                                                      size: 42.0,
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      'Male',
                                                      style: TextStyle(color: beneficiaryController.maleTextColor, fontSize: 18.0, fontFamily: Stem.medium),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  color: beneficiaryController.femaleBGColor,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons.venus,
                                                      color: beneficiaryController.femaleTextColor,
                                                      size: 42.0,
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      'Female',
                                                      style: TextStyle(color: beneficiaryController.femaleTextColor, fontSize: 18.0, fontFamily: Stem.medium),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              Container(
                                                width: 80.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                  color: beneficiaryController.otherGenderBGColor,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons.transgenderAlt,
                                                      color: beneficiaryController.otherGenderTextColor,
                                                      size: 42.0,
                                                    ),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    Text(
                                                      'Other',
                                                      style: TextStyle(color: beneficiaryController.otherGenderTextColor, fontSize: 18.0, fontFamily: Stem.medium),
                                                    )
                                                  ],
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
                                          //date picker
                                          SizedBox(
                                            height: 10.0,
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
                        onTap: () {
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

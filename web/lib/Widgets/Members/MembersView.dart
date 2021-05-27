import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Members/MembersController.dart';

class MembersView extends StatefulWidget {
  @override
  _MembersViewState createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
  MembersController memberController = new MembersController();

  callSetState() {
    setState(() {});
  }

  loadMemberList() async {
    setState(() {
      memberController.memberListRefreshIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await memberController.getMemberList(callSetState);
    setState(() {
      memberController.memberListRefreshIcon = Icon(
        FontAwesomeIcons.syncAlt,
        color: Color(0xFF6c63ff),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMemberList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.8) - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: 50.0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.83,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Members',
                      style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        'Sunday, 21 March 2021',
                        style: TextStyle(fontSize: 20.0, color: Color(0xFFa3b0cb), fontFamily: 'StemRegular'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.67,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                        child: Column(
                          children: [
                            Text(
                              "Add a member",
                              style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                            ),
                            Text(
                              "The new member will receive an email with a link to\nthe application and his/her login credentials.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontFamily: Stem.light,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 315.0,
                              child: Form(
                                key: memberController.createMemberKey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        onChanged: (value) {
                                          memberController.createMemberKey.currentState.validate();
                                        },
                                        controller: memberController.emailController,
                                        validator: (emailAddress) {
                                          if (emailAddress.isEmpty) {
                                            return "Email address cannot be empty!";
                                          } else if (!isEmail(emailAddress)) {
                                            return "Email is not valid!";
                                          }
                                          return null;
                                        },
                                        style: Common.labelTextStyle,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(top: 50.0),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Icon(FontAwesomeIcons.at),
                                          ),
                                          labelText: 'Email address',
                                          labelStyle: Common.labelTextStyle,
                                          border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(15.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 215.0,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                memberController.createMemberKey.currentState.validate();
                                              },
                                              controller: memberController.firstNameController,
                                              validator: (firstName) {
                                                if (firstName.isEmpty) {
                                                  return "First name cannot be empty!";
                                                } else if (firstName.length > 32) {
                                                  return "First name is too long!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.signature),
                                                ),
                                                labelText: 'First name',
                                                labelStyle: Common.labelTextStyle,
                                                border: new OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(
                                                    const Radius.circular(15.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                            width: 215.0,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                memberController.createMemberKey.currentState.validate();
                                              },
                                              controller: memberController.lastNameController,
                                              validator: (lastName) {
                                                if (lastName.isEmpty) {
                                                  return "Last name cannot be empty!";
                                                } else if (lastName.length > 32) {
                                                  return "Last name is too long!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.signature),
                                                ),
                                                labelText: 'Last name',
                                                labelStyle: Common.labelTextStyle,
                                                border: new OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(
                                                    const Radius.circular(15.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 215.0,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                memberController.createMemberKey.currentState.validate();
                                              },
                                              controller: memberController.phoneNumberController,
                                              validator: (phoneNumber) {
                                                if (phoneNumber.isEmpty) {
                                                  return "Phone number cannot be empty!";
                                                } else if (phoneNumber.length > 8) {
                                                  return "Phone number is too long!";
                                                } else if (phoneNumber.length < 7) {
                                                  return "Phone number is too short!";
                                                } else if (!isNumeric(phoneNumber)) {
                                                  return "Invalid phone number!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.phone),
                                                ),
                                                labelText: 'Phone number',
                                                labelStyle: Common.labelTextStyle,
                                                border: new OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(
                                                    const Radius.circular(15.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!memberController.webCheck) {
                                                setState(() {
                                                  memberController.webCheck = true;
                                                  memberController.mobileCheck = false;
                                                  memberController.hybridCheck = false;
                                                  memberController.selectedAccountType = "web";
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: memberController.webCheck ? memberController.enabledCheckBoxContainer : memberController.disabledCheckBoxContainer,
                                              ),
                                              width: 68.0,
                                              height: 55.0,
                                              child: Icon(
                                                FontAwesomeIcons.desktop,
                                                color: memberController.webCheck ? memberController.enabledCheckBoxText : memberController.disabledCheckBoxText,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!memberController.mobileCheck) {
                                                setState(() {
                                                  memberController.mobileCheck = true;
                                                  memberController.webCheck = false;
                                                  memberController.hybridCheck = false;
                                                  memberController.selectedAccountType = "mobile";
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: memberController.mobileCheck ? memberController.enabledCheckBoxContainer : memberController.disabledCheckBoxContainer,
                                              ),
                                              width: 68.0,
                                              height: 55.0,
                                              child: Icon(
                                                FontAwesomeIcons.mobileAlt,
                                                color: memberController.mobileCheck ? memberController.enabledCheckBoxText : memberController.disabledCheckBoxText,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!memberController.hybridCheck) {
                                                setState(() {
                                                  memberController.mobileCheck = false;
                                                  memberController.webCheck = false;
                                                  memberController.hybridCheck = true;
                                                  memberController.selectedAccountType = "hybrid";
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: memberController.hybridCheck ? memberController.enabledCheckBoxContainer : memberController.disabledCheckBoxContainer,
                                              ),
                                              width: 68.0,
                                              height: 55.0,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 12.5,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.desktop,
                                                    color: memberController.hybridCheck ? memberController.enabledCheckBoxText : memberController.disabledCheckBoxText,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.mobileAlt,
                                                    color: memberController.hybridCheck ? memberController.enabledCheckBoxText : memberController.disabledCheckBoxText,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            activeColor: Color(0xFF6c63ff),
                                            value: memberController.agreementBox,
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  memberController.agreementBox = value;
                                                  if (value) {
                                                    setState(() {
                                                      memberController.agreementColor = Colors.black;
                                                    });
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 3.0),
                                            child: Text(
                                              'I accept to allow the user to use Ignosia.',
                                              style: TextStyle(
                                                fontFamily: 'StemRegular',
                                                color: memberController.agreementColor,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: TextButton(
                                  onPressed: () async {
                                    FocusScope.of(context).requestFocus(new FocusNode());

                                    if (memberController.createMemberKey.currentState.validate()) {
                                      if (!memberController.agreementBox) {
                                        setState(() {
                                          memberController.agreementColor = memberController.errorAgreement;
                                        });
                                      } else if (memberController.agreementBox) {
                                        setState(() {
                                          memberController.createMemberBtnWidget = SpinKitWave(
                                            color: Colors.white,
                                            size: 25.0,
                                          );
                                        });
                                        if (await memberController.createMember(memberController.emailController.text, memberController.firstNameController.text, memberController.lastNameController.text, memberController.phoneNumberController.text, memberController.selectedAccountType, context)) {
                                          memberController.emailController.clear();
                                          memberController.firstNameController.clear();
                                          memberController.lastNameController.clear();
                                          memberController.phoneNumberController.clear();
                                          memberController.selectedAccountType = "web";
                                          memberController.webCheck = true;
                                          memberController.mobileCheck = false;
                                          memberController.hybridCheck = false;
                                          memberController.agreementBox = false;
                                          setState(() {
                                            memberController.createMemberBtnWidget = Text(
                                              "Create member",
                                              style: Common.buttonTextStyle,
                                            );
                                          });
                                        }
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                  child: memberController.createMemberBtnWidget,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Members list",
                            style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              loadMemberList();
                            },
                            child: Container(
                              width: 70.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFe1e1e1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: memberController.memberListRefreshIcon,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 470.0,
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: SingleChildScrollView(
                          child: Column(
                            children: Common.memberWidgetList,
                          ),
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
    );
  }
}

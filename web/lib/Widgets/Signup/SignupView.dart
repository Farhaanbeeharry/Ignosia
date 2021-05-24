import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Validator.dart';
import 'package:web/Widgets/Signup/SignupController.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController signupController = new SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 600,
                  decoration: BoxDecoration(
                    color: Color(0XFF6C63FF),
                  ),
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 410.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ignosia.',
                              style: TextStyle(
                                fontSize: 48.0,
                                fontFamily: 'StemBold',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'A few clicks away from being a member',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontFamily: 'StemRegular',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: 500,
                        child: SvgPicture.asset(
                          "assets/images/signUp.svg",
                          width: 500.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 600,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 80.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Complete Registration',
                              style: TextStyle(fontSize: 40.0, fontFamily: 'StemMedium', color: Colors.black),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Manage all your data and resources efficiently',
                              style: TextStyle(color: Colors.black, fontFamily: 'StemRegular', fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 7.5,
                            ),
                            Text(
                              'Let\'s get you all set up so you can start using your personal account.',
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'StemLight',
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Form(
                              key: signupController.signUpKey,
                              child: Container(
                                width: MediaQuery.of(context).size.width - 800,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: (MediaQuery.of(context).size.width - 800) / 2,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            TextFormField(
                                              onChanged: (value) {
                                                signupController.signUpKey.currentState.validate();
                                              },
                                              validator: (firstName) {
                                                if (firstName.isEmpty) {
                                                  return "First name cannot be empty!";
                                                } else if (firstName.length > 32) {
                                                  return "First name is too long!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              initialValue: Common.signUpPreData.firstName,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.signature),
                                                ),
                                                labelText: 'First name',
                                                enabled: false,
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
                                            TextFormField(
                                              onChanged: (value) {
                                                signupController.signUpKey.currentState.validate();
                                              },
                                              validator: (emailAddress) {
                                                if (emailAddress.isEmpty) {
                                                  return "Email address cannot be empty!";
                                                } else if (!isEmail(emailAddress)) {
                                                  return "Invalid email format!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              initialValue: Common.signUpPreData.emailAddress,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.at),
                                                ),
                                                labelText: 'Email address',
                                                enabled: false,
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
                                            TextFormField(
                                              onChanged: (value) {
                                                signupController.signUpKey.currentState.validate();
                                              },
                                              controller: signupController.passwordController,
                                              validator: (password) {
                                                if (password.isEmpty) {
                                                  return "Password cannot be empty!";
                                                } else if (password.length <= 8) {
                                                  return "Password too short!";
                                                } else if (password.length > 32) {
                                                  return "Password too long!";
                                                } else if (!Validator.checkSpecialCharacter(password)) {
                                                  return "Password should have atleast one special character!";
                                                } else if (!Validator.checkUpperCase(password)) {
                                                  return "Password should have atleast one upper case!";
                                                } else if (!Validator.checkLowerCase(password)) {
                                                  return "Password should have atleast one lower case!";
                                                } else if (!Validator.checkNumber(password)) {
                                                  return "Password should have atleast one number!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.lock),
                                                ),
                                                suffixIcon: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        signupController.passwordObscureTextCheck = !signupController.passwordObscureTextCheck;

                                                        signupController.passwordObscureTextIcon = signupController.passwordObscureTextCheck ? Icon(FontAwesomeIcons.eye) : Icon(FontAwesomeIcons.eyeSlash);
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 20.0),
                                                      child: signupController.passwordObscureTextIcon,
                                                    )),
                                                labelText: 'Password',
                                                labelStyle: Common.labelTextStyle,
                                                border: new OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(
                                                    const Radius.circular(15.0),
                                                  ),
                                                ),
                                              ),
                                              obscureText: signupController.passwordObscureTextCheck,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            TextFormField(
                                              onChanged: (value) {
                                                signupController.signUpKey.currentState.validate();
                                              },
                                              validator: (location) {
                                                if (location.isEmpty) {
                                                  return "Location cannot be empty!";
                                                } else if (location.length > 64) {
                                                  return "Location is too long!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              controller: signupController.locationController,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.mapMarked),
                                                ),
                                                labelText: 'Location',
                                                labelStyle: Common.labelTextStyle,
                                                border: new OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(
                                                    const Radius.circular(15.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: (MediaQuery.of(context).size.width - 800) / 2,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            TextFormField(
                                              onChanged: (value) {
                                                signupController.signUpKey.currentState.validate();
                                              },
                                              validator: (lastName) {
                                                if (lastName.isEmpty) {
                                                  return "Last name cannot be empty!";
                                                } else if (lastName.length > 32) {
                                                  return "Last name is too long!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              initialValue: Common.signUpPreData.lastName,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.signature),
                                                ),
                                                labelText: 'Last name',
                                                enabled: false,
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
                                            TextFormField(
                                              onChanged: (value) {
                                                signupController.signUpKey.currentState.validate();
                                              },
                                              validator: (phoneNumber) {
                                                if (phoneNumber.isEmpty) {
                                                  return "Phone number cannot be empty!";
                                                } else if (!isNumeric(phoneNumber)) {
                                                  return "Invalid phone number!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              initialValue: Common.signUpPreData.phoneNumber,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.phone),
                                                ),
                                                labelText: 'Phone number',
                                                enabled: false,
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
                                            TextFormField(
                                              onChanged: (value) {
                                                signupController.signUpKey.currentState.validate();
                                              },
                                              validator: (confirmPassword) {
                                                if (confirmPassword.isEmpty) {
                                                  return "Confirm password cannot be empty!";
                                                } else if (confirmPassword != signupController.passwordController.text) {
                                                  return "Password does not match!";
                                                }
                                                return null;
                                              },
                                              style: Common.labelTextStyle,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.lock),
                                                ),
                                                suffixIcon: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        signupController.confirmPasswordObscureTextCheck = !signupController.confirmPasswordObscureTextCheck;

                                                        signupController.confirmPasswordObscureTextIcon = signupController.confirmPasswordObscureTextCheck ? Icon(FontAwesomeIcons.eye) : Icon(FontAwesomeIcons.eyeSlash);
                                                      });
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(right: 20.0),
                                                      child: signupController.confirmPasswordObscureTextIcon,
                                                    )),
                                                labelText: 'Confirm password',
                                                labelStyle: Common.labelTextStyle,
                                                border: new OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(
                                                    const Radius.circular(15.0),
                                                  ),
                                                ),
                                              ),
                                              obscureText: signupController.confirmPasswordObscureTextCheck,
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: ((MediaQuery.of(context).size.width - 800) / 2) - 125,
                                                  child: TextFormField(
                                                    onChanged: (value) {
                                                      signupController.signUpKey.currentState.validate();
                                                    },
                                                    enabled: false,
                                                    validator: (date) {
                                                      if (signupController.selectedDate == "Date of birth") {
                                                        return "Select your date of birth!";
                                                      }
                                                      return null;
                                                    },
                                                    style: Common.labelTextStyle,
                                                    decoration: InputDecoration(
                                                      errorStyle: TextStyle(
                                                        color: Theme.of(context).errorColor, // or any other color
                                                      ),
                                                      contentPadding: EdgeInsets.only(top: 50.0),
                                                      prefixIcon: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                        child: Icon(FontAwesomeIcons.calendarDay),
                                                      ),
                                                      labelText: signupController.selectedDate,
                                                      labelStyle: Common.labelTextStyle,
                                                      border: new OutlineInputBorder(
                                                        borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(15.0),
                                                          bottomLeft: Radius.circular(15.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Container(
                                                  height: 58.0,
                                                  width: 90.0,
                                                  child: TextButton(
                                                      onPressed: () async {
                                                        FocusScope.of(context).requestFocus(new FocusNode());

                                                        final DateTime picked = await showDatePicker(
                                                          context: context,
                                                          initialDate: signupController.dateToday, // Refer step 1
                                                          firstDate: DateTime(1920),
                                                          lastDate: DateTime.now(),
                                                        );
                                                        String dateRAW;
                                                        if (picked != null && picked.toString() != signupController.selectedDate) {
                                                          dateRAW = picked.toString();
                                                          String displayDate = dateRAW[8] + dateRAW[9] + "/" + dateRAW[5] + dateRAW[6] + "/" + dateRAW[0] + dateRAW[1] + dateRAW[2] + dateRAW[3];

                                                          signupController.selectedDate = displayDate;

                                                          setState(() {
                                                            signupController.selectedDate = displayDate;
                                                            signupController.signUpKey.currentState.validate();
                                                          });
                                                        }
                                                      },
                                                      style: TextButton.styleFrom(
                                                        backgroundColor: Color(0XFF6C63FF),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(15.0),
                                                            bottomRight: Radius.circular(15.0),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        FontAwesomeIcons.calendarDay,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Checkbox(
                                    activeColor: Color(0xFF6c63ff),
                                    value: signupController.agreementBox,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          signupController.agreementBox = value;
                                          if (value) {
                                            setState(() {
                                              signupController.agreementColor = Colors.black;
                                            });
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    'I agree to the terms, conditions and privacy policy of Ignosia.',
                                    style: TextStyle(
                                      fontFamily: 'StemRegular',
                                      color: signupController.agreementColor,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Container(
                                    height: 50.0,
                                    width: ((MediaQuery.of(context).size.width - 800) / 2) - 30,
                                    child: TextButton(
                                      onPressed: () async {
                                        FocusScope.of(context).requestFocus(new FocusNode());

                                        if (signupController.signUpKey.currentState.validate()) {
                                          if (!signupController.agreementBox) {
                                            setState(() {
                                              signupController.agreementColor = signupController.errorAgreement;
                                            });
                                          } else if (signupController.agreementBox) {
                                            setState(() {
                                              signupController.submitBtnWidget = SpinKitWave(
                                                color: Colors.white,
                                                size: 25.0,
                                              );
                                            });
                                            await signupController.signUp(Common.signUpPreData.firstName, Common.signUpPreData.lastName, Common.signUpPreData.emailAddress, Common.signUpPreData.phoneNumber, signupController.passwordController.text, signupController.locationController.text, signupController.selectedDate, context);
                                            setState(() {
                                              signupController.submitBtnWidget = Text(
                                                "Submit",
                                                style: Common.buttonTextStyle,
                                              );
                                            });
                                          }
                                        }

                                        //Navigator.pushNamed(context, '/');
                                      },
                                      style: TextButton.styleFrom(backgroundColor: Color(0XFF6C63FF), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                      child: signupController.submitBtnWidget,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: InkWell(
                                    onTap: () {
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                      Navigator.pushNamed(context, '/Login');
                                    },
                                    child: Text(
                                      "Have an account already?",
                                      style: TextStyle(color: Color(0XFF6C63FF), fontSize: 16.0, fontFamily: 'StemLight'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 100.0,
                      ),
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

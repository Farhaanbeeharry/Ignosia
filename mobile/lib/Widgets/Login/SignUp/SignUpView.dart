import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Common/Validator.dart';
import 'package:mobile/Model/UserModel.dart';
import 'package:mobile/Widgets/Dashboard/Dashboard.dart';
import 'package:mobile/Widgets/Login/LoginView.dart';
import 'package:mobile/Widgets/Login/SignUp/SignUpController.dart';

class SignUpView extends StatefulWidget {
  final UserModel data;

  SignUpView({this.data});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpController signUpController = new SignUpController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialise();
  }

  initialise() {
    setState(() {
      signUpController.firstNameController.text = widget.data.firstName;
      signUpController.lastNameController.text = widget.data.lastName;
      signUpController.emailController.text = widget.data.emailAddress;
      signUpController.phoneNumberController.text = widget.data.phoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splashScreen.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.87,
              height: MediaQuery.of(context).size.height * 0.87,
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 25.0),
                child: new Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(35.0),
                    ),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        FocusScope.of(context).requestFocus(new FocusNode());
                                        Common.loggedInUserData = null;
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginView()),
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          color: Colors.blueAccent,
                                        ),
                                        child: Icon(
                                          FontAwesomeIcons.arrowLeft,
                                          color: Colors.white,
                                          size: 20.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      'Complete ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: Stem.light,
                                      ),
                                    ),
                                    Text(
                                      'Registration',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: Stem.medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                      color: Colors.white12,
                                    ),
                                    child: TextFormField(
                                      controller: signUpController.firstNameController,
                                      style: Common.labelTextStyle,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(top: 50.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Icon(
                                            FontAwesomeIcons.signature,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: 'First name',
                                        labelStyle: Common.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                      color: Colors.white12,
                                    ),
                                    child: TextFormField(
                                      controller: signUpController.lastNameController,
                                      style: Common.labelTextStyle,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(top: 50.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Icon(
                                            FontAwesomeIcons.signature,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: 'Last name',
                                        labelStyle: Common.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                      color: Colors.white12,
                                    ),
                                    child: TextFormField(
                                      controller: signUpController.emailController,
                                      style: Common.labelTextStyle,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(top: 50.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Icon(
                                            FontAwesomeIcons.at,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: 'Email address',
                                        labelStyle: Common.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                      color: Colors.white12,
                                    ),
                                    child: TextFormField(
                                      controller: signUpController.phoneNumberController,
                                      style: Common.labelTextStyle,
                                      enabled: false,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(top: 50.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Icon(
                                            FontAwesomeIcons.phone,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: 'Phone number',
                                        labelStyle: Common.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                      color: Colors.white12,
                                    ),
                                    child: TextFormField(
                                      controller: signUpController.passwordController,
                                      obscureText: signUpController.passwordObscureTextCheck,
                                      style: Common.labelTextStyle,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(top: 50.0),
                                        suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                signUpController.passwordObscureTextCheck = !signUpController.passwordObscureTextCheck;

                                                signUpController.passwordObscureTextIcon = signUpController.passwordObscureTextCheck
                                                    ? Icon(
                                                        FontAwesomeIcons.eye,
                                                        color: Colors.white,
                                                      )
                                                    : Icon(
                                                        FontAwesomeIcons.eyeSlash,
                                                        color: Colors.white,
                                                      );
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: signUpController.passwordObscureTextIcon,
                                            )),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Icon(
                                            FontAwesomeIcons.lock,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: 'Password',
                                        labelStyle: Common.labelTextStyle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25.0),
                                      ),
                                      color: Colors.white12,
                                    ),
                                    child: TextFormField(
                                      controller: signUpController.locationController,
                                      style: Common.labelTextStyle,
                                      decoration: InputDecoration(
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(25.0),
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.only(top: 50.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Icon(
                                            FontAwesomeIcons.mapMarkedAlt,
                                            color: Colors.white,
                                          ),
                                        ),
                                        labelText: 'Location',
                                        labelStyle: Common.labelTextStyle,
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
                                        width: (MediaQuery.of(context).size.width * 0.75) - 100,
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
                                            if (signUpController.selectedDate == "Date of birth") {
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
                                            labelText: signUpController.selectedDate,
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
                                      Spacer(),
                                      InkWell(
                                        onTap: () async {
                                          FocusScope.of(context).requestFocus(new FocusNode());

                                          final DateTime picked = await showDatePicker(
                                            context: context,
                                            initialDate: signUpController.dateToday, // Refer step 1
                                            firstDate: DateTime(1920),
                                            lastDate: DateTime.now(),
                                          );
                                          String dateRAW;
                                          if (picked != null && picked.toString() != signUpController.selectedDate) {
                                            dateRAW = picked.toString();
                                            String displayDate = dateRAW[8] + dateRAW[9] + "/" + dateRAW[5] + dateRAW[6] + "/" + dateRAW[0] + dateRAW[1] + dateRAW[2] + dateRAW[3];

                                            signUpController.selectedDate = displayDate;

                                            setState(() {
                                              signUpController.selectedDate = displayDate;
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
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InkWell(
                            onTap: () async {
                              FocusScope.of(context).requestFocus(new FocusNode());
                              setState(() {
                                signUpController.saveBtn = SpinKitWave(
                                  color: Colors.white,
                                  size: 24.0,
                                );
                              });

                              if (signUpController.passwordController.text.isEmpty) {
                                signUpController.showError(context, "Password cannot be empty!");
                              } else if (signUpController.passwordController.text.length <= 8) {
                                signUpController.showError(context, "Password too short!");
                              } else if (signUpController.passwordController.text.length > 32) {
                                signUpController.showError(context, "Password too long!");
                              } else if (!Validator.checkSpecialCharacter(signUpController.passwordController.text)) {
                                signUpController.showError(context, "Password should have atleast one special character!");
                              } else if (!Validator.checkUpperCase(signUpController.passwordController.text)) {
                                signUpController.showError(context, "Password should have atleast one upper case!");
                              } else if (!Validator.checkLowerCase(signUpController.passwordController.text)) {
                                signUpController.showError(context, "Password should have atleast one lower case!");
                              } else if (!Validator.checkNumber(signUpController.passwordController.text)) {
                                signUpController.showError(context, "Password should have atleast one number!");
                              } else if (signUpController.locationController.text.isEmpty) {
                                signUpController.showError(context, "Location cannot be empty!");
                              } else if (signUpController.locationController.text.length > 64) {
                                signUpController.showError(context, "Location is too long!");
                              } else if (signUpController.selectedDate == "Date of birth") {
                                signUpController.showError(context, "Invalid date of birth!");
                              } else {
                                if (await signUpController.signUp(context)) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePage()),
                                  );
                                }
                                setState(() {
                                  signUpController.saveBtn = Text(
                                    "Save",
                                    style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: Stem.regular),
                                  );
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.87,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                color: Colors.blueAccent,
                              ),
                              child: signUpController.saveBtn,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

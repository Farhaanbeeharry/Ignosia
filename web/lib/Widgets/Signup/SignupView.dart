import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                  color: Color(0XFF6C63FF),
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 370.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A few clicks away',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontFamily: 'StemRegular',
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'from being a member of',
                              style: TextStyle(
                                fontSize: 32.0,
                                fontFamily: 'StemRegular',
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Ignosia.',
                              style: TextStyle(
                                fontSize: 48.0,
                                fontFamily: 'StemBold',
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
                        width: 100.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 32.0,
                                  fontFamily: 'StemMedium',
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Manage all your data and resources efficiently',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'StemRegular',
                                  fontSize: 20.0),
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
                            Container(
                              width: MediaQuery.of(context).size.width - 800,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            800) /
                                        2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            validator: (emailAddress) {
                                              if (emailAddress.isEmpty) {
                                                return "Email address cannot be empty!";
                                              } else if (!isEmail(
                                                  emailAddress)) {
                                                return "Invalid email format!";
                                              }
                                              return null;
                                            },
                                            style: Common.labelTextStyle,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 50.0),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: Icon(
                                                    FontAwesomeIcons.signature),
                                              ),
                                              labelText: 'First name',
                                              labelStyle: Common.labelTextStyle,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            validator: (emailAddress) {
                                              if (emailAddress.isEmpty) {
                                                return "Email address cannot be empty!";
                                              } else if (!isEmail(
                                                  emailAddress)) {
                                                return "Invalid email format!";
                                              }
                                              return null;
                                            },
                                            style: Common.labelTextStyle,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 50.0),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child:
                                                    Icon(FontAwesomeIcons.at),
                                              ),
                                              labelText: 'Email address',
                                              labelStyle: Common.labelTextStyle,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            validator: (password) {
                                              if (password.isEmpty) {
                                                return "Password cannot be empty!";
                                              } else if (password.length <= 8) {
                                                return "Password too short!";
                                              } else if (password.length > 32) {
                                                return "Password too long!";
                                              } else if (!Validator
                                                  .checkSpecialCharacter(
                                                      password)) {
                                                return "Password should have atleast one special character!";
                                              } else if (!Validator
                                                  .checkUpperCase(password)) {
                                                return "Password should have atleast one upper case!";
                                              } else if (!Validator
                                                  .checkLowerCase(password)) {
                                                return "Password should have atleast one lower case!";
                                              } else if (!Validator.checkNumber(
                                                  password)) {
                                                return "Password should have atleast one number!";
                                              }
                                              return null;
                                            },
                                            style: Common.labelTextStyle,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 50.0),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child:
                                                    Icon(FontAwesomeIcons.lock),
                                              ),
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      signupController
                                                              .passwordObscureTextCheck =
                                                          !signupController
                                                              .passwordObscureTextCheck;

                                                      signupController
                                                              .passwordObscureTextIcon =
                                                          signupController
                                                                  .passwordObscureTextCheck
                                                              ? Icon(
                                                                  FontAwesomeIcons
                                                                      .eye)
                                                              : Icon(
                                                                  FontAwesomeIcons
                                                                      .eyeSlash);
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0),
                                                    child: signupController
                                                        .passwordObscureTextIcon,
                                                  )),
                                              labelText: 'Password',
                                              labelStyle: Common.labelTextStyle,
                                              border: OutlineInputBorder(),
                                            ),
                                            obscureText: signupController
                                                .passwordObscureTextCheck,
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            800) /
                                        2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            validator: (emailAddress) {
                                              if (emailAddress.isEmpty) {
                                                return "Email address cannot be empty!";
                                              } else if (!isEmail(
                                                  emailAddress)) {
                                                return "Invalid email format!";
                                              }
                                              return null;
                                            },
                                            style: Common.labelTextStyle,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 50.0),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: Icon(
                                                    FontAwesomeIcons.signature),
                                              ),
                                              labelText: 'Last name',
                                              labelStyle: Common.labelTextStyle,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            validator: (emailAddress) {
                                              if (emailAddress.isEmpty) {
                                                return "Email address cannot be empty!";
                                              } else if (!isEmail(
                                                  emailAddress)) {
                                                return "Invalid email format!";
                                              }
                                              return null;
                                            },
                                            style: Common.labelTextStyle,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 50.0),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child: Icon(
                                                    FontAwesomeIcons.phone),
                                              ),
                                              labelText: 'Phone number',
                                              labelStyle: Common.labelTextStyle,
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          TextFormField(
                                            validator: (password) {
                                              if (password.isEmpty) {
                                                return "Password cannot be empty!";
                                              } else if (password.length <= 8) {
                                                return "Password too short!";
                                              } else if (password.length > 32) {
                                                return "Password too long!";
                                              } else if (!Validator
                                                  .checkSpecialCharacter(
                                                      password)) {
                                                return "Password should have atleast one special character!";
                                              } else if (!Validator
                                                  .checkUpperCase(password)) {
                                                return "Password should have atleast one upper case!";
                                              } else if (!Validator
                                                  .checkLowerCase(password)) {
                                                return "Password should have atleast one lower case!";
                                              } else if (!Validator.checkNumber(
                                                  password)) {
                                                return "Password should have atleast one number!";
                                              }
                                              return null;
                                            },
                                            style: Common.labelTextStyle,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(top: 50.0),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15.0),
                                                child:
                                                    Icon(FontAwesomeIcons.lock),
                                              ),
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      signupController
                                                              .confirmPasswordObscureTextCheck =
                                                          !signupController
                                                              .confirmPasswordObscureTextCheck;

                                                      signupController
                                                              .confirmPasswordObscureTextIcon =
                                                          signupController
                                                                  .confirmPasswordObscureTextCheck
                                                              ? Icon(
                                                                  FontAwesomeIcons
                                                                      .eye)
                                                              : Icon(
                                                                  FontAwesomeIcons
                                                                      .eyeSlash);
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20.0),
                                                    child: signupController
                                                        .confirmPasswordObscureTextIcon,
                                                  )),
                                              labelText: 'Password',
                                              labelStyle: Common.labelTextStyle,
                                              border: OutlineInputBorder(),
                                            ),
                                            obscureText: signupController
                                                .confirmPasswordObscureTextCheck,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

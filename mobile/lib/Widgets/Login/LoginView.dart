import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Common/Validator.dart';
import 'package:mobile/Widgets/Login/LoginController.dart';
import 'package:validators/validators.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginController = new LoginController();

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
                      child: Form(
                        key: loginController.loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Log in to',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: Stem.light,
                                  ),
                                ),
                                Text(
                                  ' Ignosia',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontFamily: Stem.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35.0,
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
                                controller: loginController.emailController,
                                validator: (emailAddress) {
                                  if (emailAddress.isEmpty) {
                                    return "Email address cannot be empty!";
                                  } else if (!isEmail(emailAddress)) {
                                    return "Invalid email format!";
                                  }
                                  return null;
                                },
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
                              height: 15.0,
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
                                controller: loginController.passwordController,
                                validator: (password) {
                                  if (password.isEmpty) {
                                    return "Password cannot be empty!";
                                  } else if (password.length < 8) {
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
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(25.0),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(top: 50.0),
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
                              height: 25.0,
                            ),
                            InkWell(
                              onTap: () {
                                FocusScope.of(context).requestFocus(new FocusNode());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width * 0.87,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  gradient: new LinearGradient(
                                    colors: [const Color(0xff38da60), Colors.blueAccent.shade700, const Color(0xFFbe16cf)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: loginController.loginBtn,
                              ),
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
      ),
    );
  }
}

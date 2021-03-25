import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Validator.dart';
import 'package:web/Widgets/NewPassword/NewPasswordController.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  NewPasswordController newPasswordController = new NewPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Center(
          child: Container(
            child: Row(
              children: [
                SizedBox(
                  width: 160.0,
                ),
                SvgPicture.asset(
                  "assets/images/newPassword.svg",
                  width: 500.0,
                ),
                SizedBox(
                  width: 200.0,
                ),
                Form(
                  key: newPasswordController.newPasswordFormKey,
                  child: Container(
                    width: 500.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reset Password",
                          style: TextStyle(
                            fontSize: 56.0,
                            fontFamily: "StemBold",
                            color: Color(0XFF6C63FF),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter the unique reset key sent to',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontFamily: 'StemRegular',
                                ),
                              ),
                              Text(
                                Common.resetEmailAddress,
                                style: TextStyle(
                                  color: Color(0xFF3f3d56),
                                  fontSize: 16.0,
                                  fontFamily: 'StemLight',
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          controller: newPasswordController.resetKeyController,
                          validator: (resetKey) {
                            if (resetKey.isEmpty) {
                              return "Reset key cannot be empty!";
                            } else if (!isNumeric(resetKey)) {
                              return "Invalid reset key!";
                            } else if (resetKey.length != 6) {
                              return "Invalid reset key!";
                            }
                            return null;
                          },
                          style: Common.labelTextStyle,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 50.0),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Icon(FontAwesomeIcons.key),
                            ),
                            labelText: 'Reset key',
                            labelStyle: Common.labelTextStyle,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: newPasswordController.passwordController,
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
                                    newPasswordController.passwordObscureTextCheck = !newPasswordController.passwordObscureTextCheck;

                                    newPasswordController.passwordObscureTextIcon = newPasswordController.passwordObscureTextCheck ? Icon(FontAwesomeIcons.eye) : Icon(FontAwesomeIcons.eyeSlash);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: newPasswordController.passwordObscureTextIcon,
                                )),
                            labelText: 'Password',
                            labelStyle: Common.labelTextStyle,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                              ),
                            ),
                          ),
                          obscureText: newPasswordController.passwordObscureTextCheck,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          validator: (confirmPassword) {
                            if (confirmPassword.isEmpty) {
                              return "Confirm password cannot be empty!";
                            } else if (confirmPassword != newPasswordController.passwordController.text) {
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
                                    newPasswordController.confirmPasswordObscureTextCheck = !newPasswordController.confirmPasswordObscureTextCheck;

                                    newPasswordController.confirmPasswordObscureTextIcon = newPasswordController.confirmPasswordObscureTextCheck ? Icon(FontAwesomeIcons.eye) : Icon(FontAwesomeIcons.eyeSlash);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: newPasswordController.confirmPasswordObscureTextIcon,
                                )),
                            labelText: 'Confirm password',
                            labelStyle: Common.labelTextStyle,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                              ),
                            ),
                          ),
                          obscureText: newPasswordController.confirmPasswordObscureTextCheck,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50.0,
                              width: 190.0,
                              child: TextButton(
                                onPressed: () async {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  setState(() {
                                    newPasswordController.resentKeyBtnWidget = SpinKitWave(
                                      color: Colors.white,
                                      size: 25.0,
                                    );
                                  });
                                  await newPasswordController.requestKey(Common.resetEmailAddress, context);
                                  setState(() {
                                    newPasswordController.resentKeyBtnWidget = Text(
                                      "Sent. Resend?",
                                      style: Common.buttonTextStyle,
                                    );
                                  });
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: newPasswordController.btnColorDefault,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(15.0),
                                  ),
                                ),
                                child: newPasswordController.resentKeyBtnWidget,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              height: 50.0,
                              width: 150.0,
                              child: TextButton(
                                onPressed: () async {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  Navigator.pushNamed(context, '/ForgotPassword');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0XFF6C63FF),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(15.0),
                                  ),
                                ),
                                child: Text(
                                  "Edit email",
                                  style: Common.buttonTextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              height: 50.0,
                              width: 130.0,
                              child: TextButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  Navigator.pushNamed(context, '/Login');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0XFF6C63FF),
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(15.0),
                                  ),
                                ),
                                child: Text(
                                  "Cancel",
                                  style: Common.buttonTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 50.0,
                          width: double.infinity,
                          child: TextButton(
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(new FocusNode());

                              if (newPasswordController.newPasswordFormKey.currentState.validate()) {
                                setState(() {
                                  newPasswordController.savePwdBtnWidget = SpinKitWave(
                                    color: Colors.white,
                                    size: 25.0,
                                  );
                                });
                                await newPasswordController.changePassword(
                                  newPasswordController.resetKeyController.text,
                                  newPasswordController.passwordController.text,
                                  context,
                                );
                                setState(() {
                                  newPasswordController.savePwdBtnWidget = Text(
                                    "Change password",
                                    style: Common.buttonTextStyle,
                                  );
                                });
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF3f3d56),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(15.0),
                              ),
                            ),
                            child: newPasswordController.savePwdBtnWidget,
                          ),
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
    );
  }
}

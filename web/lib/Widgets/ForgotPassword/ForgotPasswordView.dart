import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Widgets/ForgotPassword/ForgotPasswordController.dart';

class ForgotPasswordView extends StatefulWidget {
  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  ForgotPasswordController forgotPasswordController = new ForgotPasswordController();

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
                  width: 100.0,
                ),
                SvgPicture.asset(
                  "assets/images/forgotPassword.svg",
                  width: 600.0,
                ),
                SizedBox(
                  width: 100.0,
                ),
                Form(
                  key: forgotPasswordController.forgotPasswordKey,
                  child: Container(
                    width: 500.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot",
                          style: TextStyle(
                            fontSize: 56.0,
                            fontFamily: "StemBold",
                            color: Color(0XFF6C63FF),
                          ),
                        ),
                        Text(
                          "Password?",
                          style: TextStyle(
                            fontSize: 56.0,
                            fontFamily: "StemBold",
                            color: Color(0XFF6C63FF),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Enter the email address associated',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: 'StemRegular',
                          ),
                        ),
                        Text(
                          'with your account.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: 'StemRegular',
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        TextFormField(
                          controller: forgotPasswordController.emailController,
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
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 50.0,
                              width: 305.0,
                              child: TextButton(
                                onPressed: () async {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  if (forgotPasswordController.forgotPasswordKey.currentState.validate()) {
                                    setState(() {
                                      forgotPasswordController.requestBtnWidget = SpinKitWave(
                                        color: Colors.white,
                                        size: 25.0,
                                      );
                                    });
                                    await forgotPasswordController.requestKey(forgotPasswordController.emailController.text, context);
                                    setState(() {
                                      forgotPasswordController.requestBtnWidget = Text(
                                        "Request reset password",
                                        style: Common.buttonTextStyle,
                                      );
                                    });
                                  }
                                },
                                style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                child: forgotPasswordController.requestBtnWidget,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              height: 50.0,
                              width: 180.0,
                              child: TextButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());

                                  Navigator.pushNamed(context, '/Login');
                                },
                                style: TextButton.styleFrom(backgroundColor: Color(0XFF6C63FF), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                child: Text(
                                  "Cancel",
                                  style: Common.buttonTextStyle,
                                ),
                              ),
                            ),
                          ],
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

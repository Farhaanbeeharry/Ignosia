import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Validator.dart';
import 'package:web/Widgets/Login/LoginController.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = new LoginController();

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
              children: [
                SizedBox(
                  width: 100.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Ignosia',
                        style: TextStyle(
                          fontFamily: 'StemBold',
                          fontSize: 100.0,
                          color: Color(0XFF6C63FF),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    SvgPicture.asset(
                      "assets/images/welcome.svg",
                      width: 700.0,
                    ),
                  ],
                ),
                SizedBox(
                  width: 100.0,
                ),
                Form(
                  key: loginController.loginFormKey,
                  child: Container(
                    width: 500.0,
                    height: 500.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log In",
                          style: TextStyle(fontSize: 58.0, fontFamily: 'StemBold', color: Color(0XFF6C63FF)),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "A hero doesn't always wear a cap",
                          style: TextStyle(fontFamily: 'StemItalic', fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        TextFormField(
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
                                const Radius.circular(15.0),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 50.0),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Icon(FontAwesomeIcons.at),
                            ),
                            labelText: 'Email address',
                            labelStyle: Common.labelTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextFormField(
                          controller: loginController.passwordController,
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
                                    loginController.obscureTextCheck = !loginController.obscureTextCheck;

                                    loginController.obscureTextIcon = loginController.obscureTextCheck ? Icon(FontAwesomeIcons.eye) : Icon(FontAwesomeIcons.eyeSlash);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: loginController.obscureTextIcon,
                                )),
                            labelText: 'Password',
                            labelStyle: Common.labelTextStyle,
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(15.0),
                              ),
                            ),
                          ),
                          obscureText: loginController.obscureTextCheck,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: 500.0,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  Navigator.pushNamed(context, '/SignUp');
                                },
                                child: Text(
                                  "No account yet?",
                                  style: TextStyle(color: Color(0XFF6C63FF), fontSize: 16.0, fontFamily: 'StemLight'),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  Navigator.pushNamed(context, '/ForgotPassword');
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(color: Color(0XFF6C63FF), fontSize: 16.0, fontFamily: 'StemLight'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          height: 50.0,
                          width: 275.0,
                          child: TextButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(new FocusNode());
                              if (loginController.loginFormKey.currentState.validate()) {
                                print("email: ${loginController.emailController.text}\npassword: ${loginController.passwordController.text}");
                                print(ApiUrl.getURL(ApiUrl.login));
                              }
                            },
                            style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                            child: Text(
                              "Log in",
                              style: Common.buttonTextStyle,
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
      ),
    );
  }
}

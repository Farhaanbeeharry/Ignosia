import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/Common/Common.dart';
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
                SvgPicture.asset(
                  "assets/images/welcome.svg",
                  width: 700.0,
                ),
                SizedBox(
                  width: 100.0,
                ),
                Container(
                  width: 500.0,
                  height: 500.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 58.0,
                            fontFamily: 'StemBold',
                            color: Color(0XFF6C63FF)),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "A hero doesn't always wear a cap",
                        style:
                            TextStyle(fontFamily: 'StemItalic', fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TextFormField(
                        style: Common.labelTextStyle,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          labelText: 'Email address',
                          labelStyle: Common.labelTextStyle,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        style: Common.labelTextStyle,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  loginController.obscureTextCheck =
                                      !loginController.obscureTextCheck;

                                  loginController.obscureTextIcon =
                                      loginController.obscureTextCheck
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off);
                                });
                              },
                              child: loginController.obscureTextIcon),
                          labelText: 'Password',
                          labelStyle: Common.labelTextStyle,
                          border: OutlineInputBorder(),
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
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              child: Text(
                                "No account yet?",
                                style: TextStyle(
                                    color: Color(0XFF6C63FF),
                                    fontSize: 16.0,
                                    fontFamily: 'StemLight'),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(
                                    color: Color(0XFF6C63FF),
                                    fontSize: 16.0,
                                    fontFamily: 'StemLight'),
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
                        width: 250.0,
                        child: TextButton(
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF3f3d56),
                          ),
                          child: Text(
                            "Log in",
                            style: Common.buttonTextStyle,
                          ),
                        ),
                      ),
                    ],
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

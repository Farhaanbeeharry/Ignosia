import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Common/Validator.dart';
import 'package:web/Widgets/Settings/SettingsController.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SettingsController settingsController = new SettingsController();

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
                      'Settings',
                      style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        Common.displayDate,
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
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Form(
                              key: settingsController.bugKey,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.59,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Report a bug?",
                                      style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/bug.svg",
                                      width: MediaQuery.of(context).size.width * 0.15,
                                    ),
                                    SizedBox(
                                      height: 25.0,
                                    ),
                                    TextFormField(
                                      controller: settingsController.bugController,
                                      validator: (bugDesription) {
                                        if (bugDesription.isEmpty) {
                                          return "Explain the bug to continue!";
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
                                          child: Icon(FontAwesomeIcons.bug),
                                        ),
                                        labelText: 'Bug description',
                                        labelStyle: Common.labelTextStyle,
                                      ),
                                      minLines: 3,
                                      maxLines: 3,
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 55.0,
                                      width: MediaQuery.of(context).size.width * 0.25,
                                      child: TextButton(
                                        onPressed: () async {
                                          FocusScope.of(context).requestFocus(new FocusNode());

                                          if (settingsController.bugKey.currentState.validate()) {
                                            await settingsController.reportBug(settingsController.bugController.text, context);
                                          }

                                          setState(() {
                                            settingsController.bugController.clear();
                                          });
                                        },
                                        style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                        child: settingsController.bugBtnWidget,
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
                  ],
                ),
              ),
              Spacer(),
              Form(
                key: settingsController.userSettingsKey,
                child: Container(
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
                      children: [
                        Text(
                          "User settings",
                          style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 400.0,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      child: TextFormField(
                                        onChanged: (value) {
                                          settingsController.userSettingsKey.currentState.validate();
                                        },
                                        controller: settingsController.firstNameController,
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
                                    SizedBox(height: 10.0),
                                    Container(
                                      child: TextFormField(
                                        onChanged: (value) {
                                          settingsController.userSettingsKey.currentState.validate();
                                        },
                                        controller: settingsController.lastNameController,
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
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      controller: settingsController.passwordController,
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
                                                settingsController.passwordObscureTextCheck = !settingsController.passwordObscureTextCheck;

                                                settingsController.passwordObscureTextIcon = settingsController.passwordObscureTextCheck ? Icon(FontAwesomeIcons.eye) : Icon(FontAwesomeIcons.eyeSlash);
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: settingsController.passwordObscureTextIcon,
                                            )),
                                        labelText: 'Password',
                                        labelStyle: Common.labelTextStyle,
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                      obscureText: settingsController.passwordObscureTextCheck,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      validator: (confirmPassword) {
                                        if (confirmPassword.isEmpty) {
                                          return "Confirm password cannot be empty!";
                                        } else if (confirmPassword != settingsController.passwordController.text) {
                                          return "Password does not match!";
                                        }
                                        return null;
                                      },
                                      controller: settingsController.confirmPasswordController,
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
                                                settingsController.confirmPasswordObscureTextCheck = !settingsController.confirmPasswordObscureTextCheck;

                                                settingsController.confirmPasswordObscureTextIcon = settingsController.confirmPasswordObscureTextCheck ? Icon(FontAwesomeIcons.eye) : Icon(FontAwesomeIcons.eyeSlash);
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(right: 20.0),
                                              child: settingsController.confirmPasswordObscureTextIcon,
                                            )),
                                        labelText: 'Confirm password',
                                        labelStyle: Common.labelTextStyle,
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(15.0),
                                          ),
                                        ),
                                      ),
                                      obscureText: settingsController.confirmPasswordObscureTextCheck,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        settingsController.userSettingsKey.currentState.validate();
                                      },
                                      controller: settingsController.locationController,
                                      validator: (location) {
                                        if (location.isEmpty) {
                                          return "Location cannot be empty!";
                                        } else if (location.length > 64) {
                                          return "Location is too long!";
                                        }
                                        return null;
                                      },
                                      style: Common.labelTextStyle,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(top: 50.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          child: Icon(FontAwesomeIcons.mapMarkerAlt),
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
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        settingsController.userSettingsKey.currentState.validate();
                                      },
                                      controller: settingsController.emailController,
                                      validator: (emailAddress) {
                                        if (emailAddress.isEmpty) {
                                          return "Email address cannot be empty!";
                                        } else if (!isEmail(emailAddress)) {
                                          return "Invalid email address format!";
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          height: 55.0,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: TextButton(
                            onPressed: () async {
                              FocusScope.of(context).requestFocus(new FocusNode());

                              if (settingsController.userSettingsKey.currentState.validate()) {
                                setState(() {
                                  settingsController.saveSettingsBtnWidget = SpinKitWave(
                                    color: Colors.white,
                                    size: 25.0,
                                  );
                                });

                                await settingsController.updateUserSettings(settingsController.firstNameController.text, settingsController.lastNameController.text, settingsController.passwordController.text, settingsController.locationController.text, settingsController.emailController.text, context);

                                setState(() {
                                  settingsController.saveSettingsBtnWidget = Text(
                                    "Save settings",
                                    style: Common.buttonTextStyle,
                                  );
                                  settingsController.firstNameController.clear();
                                  settingsController.lastNameController.clear();
                                  settingsController.passwordController.clear();
                                  settingsController.confirmPasswordController.clear();
                                  settingsController.locationController.clear();
                                  settingsController.emailController.clear();
                                  settingsController.passwordObscureTextCheck = true;
                                  settingsController.passwordObscureTextIcon = Icon(FontAwesomeIcons.eye);
                                  settingsController.confirmPasswordObscureTextCheck = true;
                                  settingsController.confirmPasswordObscureTextIcon = Icon(FontAwesomeIcons.eye);
                                });
                              }
                            },
                            style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                            child: settingsController.saveSettingsBtnWidget,
                          ),
                        ),
                      ],
                    ),
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

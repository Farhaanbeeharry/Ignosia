import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ignosia/Common/Common.dart';
import 'package:ignosia/Common/Stem.dart';
import 'package:ignosia/Widgets/Login/LoginView.dart';
import 'package:ignosia/Widgets/Profile/ProfileController.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileController = new ProfileController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 75.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset("assets/images/profile.png"),
                radius: 85.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Common.loggedInUserData.firstName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 34.0,
                        fontFamily: Stem.bold,
                      ),
                    ),
                    Text(
                      Common.loggedInUserData.lastName,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 24.0, fontFamily: Stem.light),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email address',
                  style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                ),
                Text(
                  Common.loggedInUserData.emailAddress,
                  style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Date of Birth',
                  style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                ),
                Text(
                  Common.getDOB(Common.loggedInUserData.dateOfBirth),
                  style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Phone number',
                  style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                ),
                Text(
                  Common.loggedInUserData.phoneNumber,
                  style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Address',
                  style: TextStyle(fontSize: 20.0, fontFamily: Stem.medium),
                ),
                Text(
                  Common.loggedInUserData.address,
                  style: TextStyle(fontSize: 18.0, fontFamily: Stem.light),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.0,
                width: 200.0,
                child: NeumorphicButton(
                  onPressed: () async {
                    setState(() {
                      profileController.logOutBtn = SpinKitWave(
                        color: Colors.black38,
                        size: 24.0,
                      );
                    });

                    await Future.delayed(Duration(milliseconds: 500));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                    Common.loggedInUserData = null;
                  },
                  child: Center(
                    child: profileController.logOutBtn,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

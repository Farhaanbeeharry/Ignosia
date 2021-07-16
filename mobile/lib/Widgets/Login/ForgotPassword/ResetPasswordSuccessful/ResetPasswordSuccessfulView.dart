import 'dart:ui';

import 'package:Ignosia/Common/Stem.dart';
import 'package:Ignosia/Widgets/Login/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordSuccessfulView extends StatefulWidget {
  @override
  _ResetPasswordSuccessfulViewState createState() => _ResetPasswordSuccessfulViewState();
}

class _ResetPasswordSuccessfulViewState extends State<ResetPasswordSuccessfulView> {
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
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontFamily: Stem.light,
                                ),
                              ),
                              Text(
                                ' Reset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontFamily: Stem.bold,
                                ),
                              ),
                              Text(
                                '!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontFamily: Stem.light,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          SvgPicture.asset(
                            "assets/images/success.svg",
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'You will received an email with the new password to your email address. Please check and login with the new password.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: Stem.regular),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          InkWell(
                            onTap: () async {
                              FocusScope.of(context).requestFocus(new FocusNode());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              );
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
                              child: Text(
                                "Okay",
                                style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: Stem.regular),
                              ),
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
    );
  }
}

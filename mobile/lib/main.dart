import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Widgets/Login/LoginView.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectToLogin();
  }

  redirectToLogin() {
    new Timer(new Duration(seconds: 2), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splashScreen.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 25.0),
              child: new Container(
                decoration: new BoxDecoration(color: Colors.black.withOpacity(0.3)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ignosia.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 54.0,
                          fontFamily: Stem.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: 100.0,
                        height: 3.0,
                        color: Colors.white,
                      ),
                    ],
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

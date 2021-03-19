import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => null,
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 100.0,
                    color: Color(0XFF6C63FF),
                    fontFamily: 'StemBold',
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Coming soon...',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontFamily: 'StemLight',
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

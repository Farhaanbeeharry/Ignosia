import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobile/Widgets/Compose/EmailWidget/EmailWidgetController.dart';

class EmailWidget extends StatefulWidget {
  final String firstName, lastName, emailAddress;

  EmailWidget({this.firstName, this.lastName, this.emailAddress});

  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  EmailWidgetController emailWidgetController = new EmailWidgetController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}

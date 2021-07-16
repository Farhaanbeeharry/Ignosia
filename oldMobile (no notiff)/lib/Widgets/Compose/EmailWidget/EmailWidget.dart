import 'dart:ui';

import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Widgets/Compose/EmailWidget/EmailWidgetController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmailWidget extends StatefulWidget {
  final String firstName, lastName, emailAddress, id;

  EmailWidget({this.firstName, this.lastName, this.emailAddress, this.id});

  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  EmailWidgetController emailWidgetController = new EmailWidgetController();

  callSetState() {
    setState(() {});
  }

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
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 30.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: emailWidgetController.emailKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Compose',
                                style: TextStyle(fontSize: 28.0, fontFamily: Stem.bold),
                              ),
                              Spacer(),
                              Container(
                                height: 50.0,
                                width: 50.0,
                                child: NeumorphicButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Icon(FontAwesomeIcons.times),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'To (name):',
                            style: TextStyle(fontSize: 18.0, fontFamily: Stem.medium),
                          ),
                          Text(
                            widget.firstName + " " + widget.lastName,
                            style: TextStyle(fontSize: 16.0, fontFamily: Stem.light),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'To (email):',
                            style: TextStyle(fontSize: 18.0, fontFamily: Stem.medium),
                          ),
                          Text(
                            widget.emailAddress,
                            style: TextStyle(fontSize: 16.0, fontFamily: Stem.light),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (subject) {
                              if (subject.isEmpty) {
                                return "Subject cannot be empty!";
                              }
                              return null;
                            },
                            controller: emailWidgetController.subjectController,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: Stem.regular,
                            ),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(top: 50.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Icon(FontAwesomeIcons.heading),
                              ),
                              labelText: 'Subject',
                              labelStyle: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontFamily: Stem.regular,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          TextFormField(
                            validator: (emailContent) {
                              if (emailContent.isEmpty) {
                                return "Email content cannot be empty!";
                              }
                              return null;
                            },
                            controller: emailWidgetController.emailContentController,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: Stem.regular,
                            ),
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(15.0),
                                ),
                              ),
                              contentPadding: EdgeInsets.only(top: 50.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Icon(FontAwesomeIcons.commentAlt),
                              ),
                              labelText: 'Email content',
                              labelStyle: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontFamily: Stem.regular,
                              ),
                            ),
                            minLines: 7,
                            maxLines: 7,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: Container(
                              height: 50.0,
                              width: 200.0,
                              child: NeumorphicButton(
                                onPressed: () async {
                                  setState(() {
                                    emailWidgetController.sendEmailBtn = SpinKitWave(
                                      color: Colors.black,
                                      size: 24.0,
                                    );
                                  });

                                  if (emailWidgetController.emailKey.currentState.validate()) {
                                    await emailWidgetController.sendEmail(context, callSetState, widget.id, widget.emailAddress, emailWidgetController.subjectController.text, emailWidgetController.emailContentController.text);
                                  }

                                  setState(() {
                                    emailWidgetController.sendEmailBtn = Text(
                                      'Send email',
                                      style: TextStyle(fontSize: 18.0, fontFamily: Stem.regular),
                                    );
                                  });
                                },
                                child: Center(
                                  child: emailWidgetController.sendEmailBtn,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
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
    ;
  }
}

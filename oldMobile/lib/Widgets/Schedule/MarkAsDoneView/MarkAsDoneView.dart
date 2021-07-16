import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/ScheduleModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'MarkAsDoneViewController.dart';

class MarkAsDoneView extends StatefulWidget {
  final ScheduleModel schedule;
  final Function loadData;

  MarkAsDoneView({this.schedule, this.loadData});

  @override
  _MarkAsDoneViewState createState() => _MarkAsDoneViewState();
}

class _MarkAsDoneViewState extends State<MarkAsDoneView> {
  MarkAsDoneController markAsDoneController = new MarkAsDoneController();

  callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009a8c),
        toolbarHeight: 70.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            widget.schedule.name,
            style: TextStyle(fontSize: 24.0, fontFamily: Stem.medium, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/security.svg",
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  'By submitting this form, I hereby acknowledge that the given information should remain confidential.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xff7B7B7B), fontSize: 12.0, fontFamily: Stem.light),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        markAsDoneController.agreementChecked = !markAsDoneController.agreementChecked;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      width: 23.0,
                      height: 23.0,
                      decoration: BoxDecoration(
                        color: markAsDoneController.agreementChecked ? Color(0xff009a8c) : Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(markAsDoneController.agreementChecked ? 5.0 : 15.0),
                        ),
                      ),
                      child: Icon(
                        markAsDoneController.agreementChecked ? FontAwesomeIcons.check : FontAwesomeIcons.solidCircle,
                        size: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      'I agree to the terms and conditions.',
                      style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: Stem.regular),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 50.0,
                child: RaisedButton(
                  onPressed: markAsDoneController.agreementChecked
                      ? () async {
                          setState(() {
                            markAsDoneController.submitBtnWidget = SpinKitWave(
                              color: Colors.white,
                              size: 24.0,
                            );
                          });
                          await markAsDoneController.setAsDone(widget.schedule.iD, widget.loadData, context);
                          setState(() {
                            markAsDoneController.submitBtnWidget = Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: Stem.medium,
                              ),
                            );
                          });
                        }
                      : null,
                  color: Color(0xff009a8c),
                  child: markAsDoneController.submitBtnWidget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

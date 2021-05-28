import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/UserModel.dart';
import 'package:web/Widgets/Members/MemberWidget/MemberWidgetController.dart';

class MemberWidget extends StatefulWidget {
  final UserModel memberData;
  final Function callSetState;

  MemberWidget({this.memberData, this.callSetState});

  @override
  _MemberWidgetState createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  callWidgetSetState() {
    setState(() {});
  }

  MemberWidgetController memberWidgetController = new MemberWidgetController();

  Widget getUserDeviceIcon() {
    if (widget.memberData.webUser == 'true' && widget.memberData.mobileUser == 'true') {
      return Row(
        children: [
          Icon(
            FontAwesomeIcons.desktop,
            color: Color(0xFF6c63ff),
            size: 20.0,
          ),
          Icon(
            FontAwesomeIcons.mobileAlt,
            color: Color(0xFF6c63ff),
            size: 20.0,
          ),
        ],
      );
    } else {
      return Icon(
        widget.memberData.webUser == "true" ? FontAwesomeIcons.desktop : FontAwesomeIcons.mobileAlt,
        color: Color(0xFF6c63ff),
        size: 20.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.32,
          height: 120.0,
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 350.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.memberData.firstName + " " + widget.memberData.lastName,
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontFamily: Stem.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            getUserDeviceIcon(),
                          ],
                        ),
                        SizedBox(
                          height: 7.5,
                        ),
                        Text(
                          widget.memberData.emailAddress,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Stem.light,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.memberData.phoneNumber,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Stem.light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                widget.memberData.status == "admin" || Common.loggedInData.status != "admin"
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                          color: Color(0xFF6c63ff),
                        ),
                        width: 60.0,
                        height: 120.0,
                        child: Icon(
                          FontAwesomeIcons.userLock,
                          color: Colors.white,
                          size: 28.0,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          memberWidgetController.showDeleteWarning(widget.memberData.iD, widget.memberData.firstName + " " + widget.memberData.lastName, widget.memberData.emailAddress, widget.memberData.phoneNumber, widget.callSetState, callWidgetSetState, context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF6c63ff),
                          ),
                          width: 60.0,
                          height: 120.0,
                          child: Icon(
                            FontAwesomeIcons.trash,
                            color: Colors.white,
                            size: 28.0,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

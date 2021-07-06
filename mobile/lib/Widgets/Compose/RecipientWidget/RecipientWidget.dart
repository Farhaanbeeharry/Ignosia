import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/RecipientModel.dart';
import 'package:mobile/Widgets/Compose/EmailWidget/EmailWidget.dart';
import 'package:mobile/Widgets/Compose/RecipientWidget/RecipientController.dart';

class RecipientWidget extends StatefulWidget {
  final RecipientModel recipient;

  RecipientWidget({this.recipient});

  @override
  _RecipientWidgetState createState() => _RecipientWidgetState();
}

class _RecipientWidgetState extends State<RecipientWidget> {
  RecipientWidgetController recipientWidgetController = new RecipientWidgetController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            // color: Color(0xFFc5d7db),
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF31196d).withOpacity(0.4),
                  const Color(0xFF2ebec6).withOpacity(0.4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Row(
            children: [
              Container(
                height: 90.0,
                width: MediaQuery.of(context).size.width - 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipient.firstName + ' ' + widget.recipient.lastName,
                        style: TextStyle(fontSize: 20.0, fontFamily: Stem.regular),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        widget.recipient.emailAddress.toLowerCase(),
                        style: TextStyle(fontSize: 14.0, fontFamily: Stem.light),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 90.0,
                height: 90.0,
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    return showDialog<void>(
                      context: context,
                      barrierDismissible: true, // user must tap button!
                      builder: (BuildContext context) {
                        return EmailWidget(firstName: widget.recipient.firstName, lastName: widget.recipient.lastName, emailAddress: widget.recipient.emailAddress.toLowerCase(), id: widget.recipient.id);
                      },
                    );
                  },
                  child: Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Color(0xFF31196d).withOpacity(0.5),
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidPaperPlane,
                      size: 24.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

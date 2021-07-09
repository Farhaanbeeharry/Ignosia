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
        SizedBox(
          height: 10.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFF01877b),
                  const Color(0xFF00b8a7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            // color: Color(0xFFc5d7db),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
            child: Row(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipient.firstName + " " + widget.recipient.lastName,
                        style: TextStyle(fontFamily: Stem.medium, fontSize: 22.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 180,
                        child: Text(
                          widget.recipient.emailAddress,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontFamily: Stem.regular, fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
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
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(
                        FontAwesomeIcons.solidPaperPlane,
                        color: Color(0xff01877b),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

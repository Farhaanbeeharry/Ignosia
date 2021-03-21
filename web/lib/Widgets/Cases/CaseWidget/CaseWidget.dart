import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CaseWidget extends StatefulWidget {
  @override
  _CaseWidgetState createState() => _CaseWidgetState();
}

class _CaseWidgetState extends State<CaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.275,
          height: 120.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: Container(
                  width: 300.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Farhaan Beeharry',
                        style: TextStyle(fontSize: 20.0, color: Color(0xFF6c63ff), fontFamily: 'StemMedium'),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        'Phone: 57076881',
                        style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: 'StemRegular'),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Rue Anderson Forrester Port-Louis',
                        style: TextStyle(fontSize: 12.0, color: Colors.black, fontFamily: 'StemLight'),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'Needs food. No money because of Covid-19.',
                        style: TextStyle(fontSize: 12.0, color: Colors.black, fontFamily: 'StemLight'),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                    color: Color(0xFF6c63ff),
                  ),
                  alignment: Alignment.center,
                  width: 70.0,
                  child: Icon(
                    FontAwesomeIcons.trashAlt,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

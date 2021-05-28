import 'package:flutter/material.dart';
import 'package:web/Common/Common.dart';

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.8) - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: 50.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Analytics & Report',
                style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  Common.displayDate,
                  style: TextStyle(fontSize: 20.0, color: Color(0xFFa3b0cb), fontFamily: 'StemRegular'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:web/Common/Stem.dart';

class EventWidget extends StatefulWidget {
  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          width: 500.0,
          height: 150.0,
          child: Row(
            children: [
              Container(
                width: 15.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  color: Color(0xFF6c63ff),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Container(
                width: 280.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Event name',
                          style: TextStyle(color: Colors.black, fontSize: 24.0, fontFamily: Stem.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      'Will be distributing briani for dinner',
                      style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: Stem.medium),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Sponsored by Adidas',
                      style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: Stem.light),
                    ),
                    SizedBox(
                      height: 2.5,
                    ),
                    Text(
                      'Created for youngsters',
                      style: TextStyle(color: Colors.black, fontSize: 14.0, fontFamily: Stem.light),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cost = Rs 10000',
                          style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: Stem.medium),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: Color(0xFF6c63ff),
                ),
                width: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '23/05',
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: Stem.regular),
                    ),
                    Text(
                      '2021',
                      style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.regular),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      color: Colors.white,
                      height: 1.0,
                      width: 40.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '19:00',
                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontFamily: Stem.regular),
                    ),
                  ],
                ),
              )
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

import 'package:flutter/material.dart';
import 'package:web/Common/Stem.dart';

class MembersView extends StatefulWidget {
  @override
  _MembersViewState createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.83,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Members',
                      style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        'Sunday, 21 March 2021',
                        style: TextStyle(fontSize: 20.0, color: Color(0xFFa3b0cb), fontFamily: 'StemRegular'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.67,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Add a member",
                              style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Members list",
                        style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

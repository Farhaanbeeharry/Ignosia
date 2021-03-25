import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Widgets/Cases/CaseWidget/CaseWidget.dart';

class CaseView extends StatefulWidget {
  @override
  _CaseViewState createState() => _CaseViewState();
}

class _CaseViewState extends State<CaseView> {
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
                      'Cases',
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create a case',
                              style: TextStyle(fontSize: 32.0, color: Color(0xFF3f3d56), fontFamily: 'StemBold'),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            TextFormField(
                              validator: (emailAddress) {
                                return null;
                              },
                              style: Common.labelTextStyle,
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(top: 50.0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(FontAwesomeIcons.signature),
                                ),
                                labelText: 'Person name',
                                labelStyle: Common.labelTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              validator: (emailAddress) {
                                return null;
                              },
                              style: Common.labelTextStyle,
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(top: 50.0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(FontAwesomeIcons.phone),
                                ),
                                labelText: 'Phone number',
                                labelStyle: Common.labelTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              validator: (emailAddress) {
                                return null;
                              },
                              style: Common.labelTextStyle,
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(top: 50.0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(FontAwesomeIcons.locationArrow),
                                ),
                                labelText: 'Location',
                                labelStyle: Common.labelTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              validator: (emailAddress) {
                                return null;
                              },
                              style: Common.labelTextStyle,
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(top: 50.0),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  child: Icon(FontAwesomeIcons.stickyNote),
                                ),
                                labelText: 'Notes',
                                labelStyle: Common.labelTextStyle,
                              ),
                              minLines: 4,
                              maxLines: 4,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Container(
                              height: 50.0,
                              width: MediaQuery.of(context).size.width * 0.33,
                              child: TextButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                },
                                style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                child: Text(
                                  'Create case',
                                  style: Common.buttonTextStyle,
                                ),
                              ),
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
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Cases',
                            style: TextStyle(fontSize: 36.0, color: Color(0xFF3f3d56), fontFamily: 'StemMedium'),
                          ),
                          SizedBox(
                            width: 80.0,
                          ),
                          Container(
                            width: 175.0,
                            child: TextFormField(
                              validator: (emailAddress) {
                                return null;
                              },
                              style: Common.labelTextStyle,
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(15.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(top: 50.0, left: 20.0),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Container(
                                      width: 45.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        color: Color(0xFF6c63ff),
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                labelText: 'Search ...',
                                labelStyle: Common.labelTextStyle,
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(new FocusNode());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                width: 45.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Color(0xFF6c63ff),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.undoAlt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Scrollbar(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  CaseWidget(),
                                  CaseWidget(),
                                  CaseWidget(),
                                  CaseWidget(),
                                  CaseWidget(),
                                  CaseWidget(),
                                  CaseWidget(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
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

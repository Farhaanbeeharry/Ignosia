import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Beneficiary/BeneficiaryDetailedWidget/BeneficiaryDetailedController.dart';

class BeneficiaryDetailedWidget extends StatefulWidget {
  @override
  _BeneficiaryDetailedWidgetState createState() => _BeneficiaryDetailedWidgetState();
}

class _BeneficiaryDetailedWidgetState extends State<BeneficiaryDetailedWidget> {
  BeneficiaryDetailedController beneficiaryDetailedController = new BeneficiaryDetailedController();

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
          width: MediaQuery.of(context).size.width * 0.28,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Farhaan Beeharry',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                      fontFamily: Stem.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Male',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                      Text(
                        ' of ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Text(
                        '23 years old',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        'National ID: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Text(
                        'B220598010250E',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Date of birth: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Text(
                        '22 May 1998',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.medium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '2 James Anderson Forrester street, Port-Louis',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responsible party name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Imteaz Beeharry',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Responsible party relationship: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Father',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qualification year: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '2021',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'School: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Notre Dame de la Paix RCA School and Royal College Curepipe',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'University: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Middlesex University Mauritius',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Skill: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'None',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work experience: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Mobile developer and network engineer',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Working capabilities: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Mobile developer and network engineer',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current workplace: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'None',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current workplace role: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'None',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marital status: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Single',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Police record: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'None',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receives pension: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Social aid: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home phone: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '2149687',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile phone: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '57076881',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work from date: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'May 2019',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work to date: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'August 2020',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of children: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '0',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notes: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: Stem.light,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'This is a test paragraph and data should be used only for testing purposes.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontFamily: Stem.medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          sendEmailDialog("Farhaan Beeharry", "farhaanbeeharry.ms@gmail.com");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xFF6c63ff),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          width: 175.0,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.solidPaperPlane,
                                size: 26.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                child: Text(
                                  "Email",
                                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.medium),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          width: 175.0,
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.trashAlt,
                                size: 26.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: Stem.medium),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> sendEmailDialog(String name, String emailAddress) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Scaffold(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
            body: Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 500.0,
                  width: 1200.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/email.svg",
                        width: 300.0,
                      ),
                      SizedBox(
                        width: 125.0,
                      ),
                      Container(
                        width: 500.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Send email',
                              style: TextStyle(fontSize: 54.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'To: ',
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                ),
                                Text(
                                  emailAddress,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            TextFormField(
                              validator: (subject) {
                                if (subject.isEmpty) {
                                  return "Subject cannot be empty!";
                                }
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
                                  child: Icon(FontAwesomeIcons.heading),
                                ),
                                labelText: 'Subject',
                                labelStyle: Common.labelTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              validator: (emailContent) {
                                if (emailContent.isEmpty) {
                                  return "Email content cannot be empty!";
                                }
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
                                  child: Icon(FontAwesomeIcons.commentAlt),
                                ),
                                labelText: 'Email content',
                                labelStyle: Common.labelTextStyle,
                              ),
                              minLines: 5,
                              maxLines: 5,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.0,
                                  width: 500.0,
                                  child: TextButton(
                                    onPressed: () {
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                    },
                                    style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                    child: beneficiaryDetailedController.sendEmailBtnWidget,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Stem.dart';

class BeneficiaryValidatorView extends StatefulWidget {
  @override
  _BeneficiaryValidatorViewState createState() => _BeneficiaryValidatorViewState();
}

class _BeneficiaryValidatorViewState extends State<BeneficiaryValidatorView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20.0,
        ),
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
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.green,
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
                                FontAwesomeIcons.checkCircle,
                                size: 26.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                child: Text(
                                  "Validate",
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
                                FontAwesomeIcons.timesCircle,
                                size: 26.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0, right: 2.0),
                                child: Text(
                                  "Reject",
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
}

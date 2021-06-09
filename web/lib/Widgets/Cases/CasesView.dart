import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Cases/CasesController.dart';

class CaseView extends StatefulWidget {
  @override
  _CaseViewState createState() => _CaseViewState();
}

class _CaseViewState extends State<CaseView> {
  CaseController caseController = new CaseController();

  callSetState() {
    setState(() {});
  }

  loadData() {
    getCases();
  }

  getCases() async {
    setState(() {
      caseController.refreshBtnIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await caseController.getCaseList(callSetState, loadData);
    setState(() {
      caseController.refreshBtnIcon = Icon(
        FontAwesomeIcons.syncAlt,
        color: Color(0xFF6c63ff),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

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
                        Common.displayDate,
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
                        child: Form(
                          key: caseController.createCaseKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Create a case',
                                style: TextStyle(fontSize: 32.0, color: Color(0xFF6c63ff), fontFamily: 'StemBold'),
                              ),
                              SizedBox(
                                height: 12.0,
                              ),
                              Container(
                                height: 335.0,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (name) {
                                          if (name.isEmpty) {
                                            return "Name cannot be empty!";
                                          } else if (name.length > 32) {
                                            return "Name is too long!";
                                          } else
                                            return null;
                                        },
                                        controller: caseController.nameController,
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
                                        validator: (phoneNumber) {
                                          if (phoneNumber.isEmpty) {
                                            return "Phone number cannot be empty!";
                                          } else if (phoneNumber.length < 7 || phoneNumber.length > 8) {
                                            return "Invalid phone number";
                                          } else if (!isNumeric(phoneNumber)) {
                                            return "Invalid phone number";
                                          } else
                                            return null;
                                        },
                                        controller: caseController.phoneNumberController,
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
                                        validator: (location) {
                                          if (location.isEmpty) {
                                            return "Location cannot be empty!";
                                          } else if (location.length > 100) {
                                            return "Location is too long!";
                                          } else
                                            return null;
                                        },
                                        controller: caseController.locationController,
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
                                        validator: (notes) {
                                          if (notes.isEmpty) {
                                            return "Notes cannot be emppty!";
                                          } else
                                            return null;
                                        },
                                        controller: caseController.notesController,
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
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                height: 50.0,
                                width: MediaQuery.of(context).size.width * 0.33,
                                child: TextButton(
                                  onPressed: () async {
                                    FocusScope.of(context).requestFocus(new FocusNode());

                                    if (caseController.createCaseKey.currentState.validate()) {
                                      setState(() {
                                        caseController.createCaseBtn = SpinKitWave(
                                          color: Colors.white,
                                          size: 25.0,
                                        );
                                      });

                                      if (await caseController.createCase(caseController.nameController.text, caseController.phoneNumberController.text, caseController.locationController.text, caseController.notesController.text, context, callSetState)) {
                                        setState(() {
                                          caseController.nameController.clear();
                                          caseController.phoneNumberController.clear();
                                          caseController.locationController.clear();
                                          caseController.notesController.clear();
                                        });
                                      }

                                      loadData();
                                      setState(() {
                                        caseController.createCaseBtn = Text(
                                          'Create case',
                                          style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: Stem.regular),
                                        );
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                  child: caseController.createCaseBtn,
                                ),
                              ),
                            ],
                          ),
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
                            style: TextStyle(fontSize: 36.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                          ),
                          SizedBox(
                            width: 80.0,
                          ),
                          Container(
                            width: 175.0,
                            child: TextFormField(
                              onChanged: (value) {
                                print('changed: ' + value);
                              },
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
                              loadData();
                            },
                            child: Container(
                              width: 70.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFe1e1e1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.0),
                                ),
                              ),
                              child: caseController.refreshBtnIcon,
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
                                children: Common.caseWidgetList,
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

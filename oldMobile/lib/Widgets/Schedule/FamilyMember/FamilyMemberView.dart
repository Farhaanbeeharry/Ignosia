import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/ScheduleModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'FamilyMemberController.dart';

class FamilyMemberView extends StatefulWidget {
  final ScheduleModel schedule;

  FamilyMemberView({this.schedule});

  @override
  _FamilyMemberViewState createState() => _FamilyMemberViewState();
}

class _FamilyMemberViewState extends State<FamilyMemberView> {
  FamilyMemberController familyMemberController = new FamilyMemberController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await loadFamilyMembers();
  }

  loadFamilyMembers() async {
    await familyMemberController.getFamilyMembers(widget.schedule.iD, callSetState, context, loadData);
  }

  callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 70.0,
        height: 70.0,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF009a8c),
          child: Container(
            child: familyMemberController.FABWidget,
          ),
          onPressed: () async {
            setState(() {
              familyMemberController.FABWidget = SpinKitWave(
                color: Colors.white,
                size: 24.0,
              );
            });
            await familyMemberController.addFamilyMember(widget.schedule.iD, callSetState, loadData, context);
            setState(() {
              familyMemberController.FABWidget = Icon(
                FontAwesomeIcons.plus,
                size: 28.0,
              );
            });
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF009a8c),
        toolbarHeight: 70.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            widget.schedule.name,
            style: TextStyle(fontSize: 24.0, fontFamily: Stem.medium, color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Family Members",
                      style: TextStyle(fontSize: 28.0, color: Colors.black, fontFamily: Stem.bold),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 50.0,
                    width: 70.0,
                    child: NeumorphicButton(
                      onPressed: () async {
                        setState(() {
                          familyMemberController.listLoaded = false;
                        });

                        await familyMemberController.getFamilyMembers(widget.schedule.iD, callSetState, context, loadData);

                        setState(() {
                          familyMemberController.listLoaded = true;
                        });
                      },
                      child: Center(
                        child: familyMemberController.listLoaded
                            ? Icon(
                                FontAwesomeIcons.sync,
                                size: 24.0,
                              )
                            : SpinKitWave(
                                color: Colors.black,
                                size: 24.0,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.shieldAlt,
                  color: Color(0xFF1BC23C),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text(
                    "Data Collection",
                    style: TextStyle(color: Color(0xFF9499AA), fontSize: 22.0, fontFamily: Stem.light),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'The following personal data is considered \'sensitive\' and is subject to specific processing conditions.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF9499AA), fontFamily: Stem.light),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 310.0,
              child: SingleChildScrollView(
                  child: Column(
                children: familyMemberController.familyMemberList,
              )),
            )
          ],
        ),
      ),
    );
  }
}

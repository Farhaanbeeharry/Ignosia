import 'package:flutter/material.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/ScheduleModel.dart';
import 'package:mobile/Widgets/Schedule/FamilyMember/FamilyMemberController.dart';

class FamilyMemberView extends StatefulWidget {
  final ScheduleModel schedule;

  FamilyMemberView({this.schedule});

  @override
  _FamilyMemberViewState createState() => _FamilyMemberViewState();
}

class _FamilyMemberViewState extends State<FamilyMemberView> {
  FamilyMemberController familyMemberController = new FamilyMemberController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            widget.schedule.name,
            style: TextStyle(fontSize: 24.0, fontFamily: Stem.medium, color: Colors.white),
          ),
        ),
        actions: [familyMemberController.loadingWidget],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Family Members",
                style: TextStyle(fontSize: 28.0, color: Colors.black, fontFamily: Stem.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

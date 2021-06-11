import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/CaseModel.dart';
import 'package:web/Widgets/Schedule/CaseScheduleWidget/CaseScheduleWidgetController.dart';

class CaseScheduleWidget extends StatefulWidget {
  final CaseModel data;
  final BuildContext context;
  final Function refreshData;
  final Function clearInputs;

  CaseScheduleWidget({this.data, this.context, this.refreshData, this.clearInputs});

  @override
  _CaseScheduleWidgetState createState() => _CaseScheduleWidgetState();
}

class _CaseScheduleWidgetState extends State<CaseScheduleWidget> {
  CaseScheduleController caseScheduleController = new CaseScheduleController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 15.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.29,
          height: 120.0,
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 350.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data.name,
                          style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          widget.data.location,
                          style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: Stem.medium),
                        ),
                        Text(
                          widget.data.phoneNumber,
                          style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: Stem.regular),
                        ),
                        Container(
                          width: 300.0,
                          child: Text(
                            widget.data.notes,
                            style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: Stem.regular),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    if (SetSchedule.selectedUserID == "null" || SetSchedule.selectedTime == "null" || SetSchedule.selectedDate == "null") {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        btnOkColor: Color(0xFFd93e47),
                        title: "Failed to create schedule!",
                        width: MediaQuery.of(context).size.width * 0.4,
                        dismissOnTouchOutside: true,
                        desc: "Please fill all the information!",
                        btnOkOnPress: () {},
                      ).show();
                    } else {
                      setState(() {
                        caseScheduleController.refreshBtnIcon = SpinKitWave(
                          color: Colors.white,
                          size: 25.0,
                        );
                      });

                      await caseScheduleController.addSchedule(widget.data, widget.context, widget.refreshData, widget.clearInputs);
                      setState(() {
                        caseScheduleController.refreshBtnIcon = Icon(
                          FontAwesomeIcons.save,
                          size: 36.0,
                          color: Colors.white,
                        );
                      });
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF6c63ff),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    width: 70.0,
                    child: caseScheduleController.refreshBtnIcon,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BeneficiaryModel.dart';
import 'package:web/Model/ResponseModel.dart';
import 'package:web/Widgets/Validator/BeneficiaryValidator/BeneficiaryValidatorView.dart';
import 'package:web/Widgets/Validator/EmptyBeneficiaryScheduleWidget/EmptyBeneficiaryScheduleWidget.dart';

class ValidatorScheduleController {
  Widget btnIcon = Icon(
    FontAwesomeIcons.angleDoubleRight,
    size: 42.0,
    color: Colors.white,
  );

  Future<void> getBeneficiaries(String scheduleID, Function callValidatorSetState, BuildContext secondaryContext, Function callSetState) async {
    getFromSchedules(scheduleID, callValidatorSetState, secondaryContext, callSetState);
  }

  void getFromSchedules(String scheduleID, Function callValidatorSetState, BuildContext secondaryContext, Function callSetState) async {
    var body = {"scheduleID": scheduleID};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.getBeneficiaryFromSchedule), body);

    bool emptyListCheck = true;

    for (var datum in response.data) {
      BeneficiaryModel beneficiaryData = BeneficiaryModel().fromJson(datum);
      if (beneficiaryData.validated == 'false' && beneficiaryData.rejected == 'false') emptyListCheck = false;
    }

    if (response.success) {
      Common.validatorBeneficiaryWidgetList.clear();
      if (emptyListCheck) {
        Common.validatorBeneficiaryWidgetList.add(Container(
          height: 450.0,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/complete.svg",
                width: 200.0,
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "All beneficiaries checked...",
                style: TextStyle(color: Color(0xFF6c63ff), fontSize: 30.0, fontFamily: Stem.bold),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Do you want to mark schedule as completed?",
                style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: Stem.regular),
              ),
              SizedBox(
                height: 15.0,
              ),
              YesButton(
                id: scheduleID,
                callValidatorSetState: callValidatorSetState,
                secondaryContext: secondaryContext,
              ),
            ],
          ),
        ));
      } else {
        Common.validatorBeneficiaryList.clear();

        for (int i = 0; i < response.data.length; i++) {
          BeneficiaryModel beneficiary = BeneficiaryModel().fromJson(response.data[i]);
          if (beneficiary.rejected == 'false' && beneficiary.validated == 'false') Common.validatorBeneficiaryList.add(beneficiary);
        }

        for (var beneficiary in Common.validatorBeneficiaryList) {
          if (beneficiary.rejected == 'false' && beneficiary.validated == 'false') {
            Common.validatorBeneficiaryWidgetList.add(BeneficiaryValidatorView(data: beneficiary, callSetState: callSetState, secondaryContext: secondaryContext, callValidatorSetState: callValidatorSetState));
          }
        }
      }
    } else {
      Common.validatorBeneficiaryWidgetList.clear();
      Common.validatorBeneficiaryWidgetList.add(Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Failed to fetch case list! Click \'Refresh\' to try again.',
            style: TextStyle(
              fontFamily: Stem.light,
              color: Colors.red,
              fontSize: 15.0,
            ),
          ),
        ],
      ));
    }
    callValidatorSetState();
  }
}

class YesButton extends StatefulWidget {
  final String id;
  final BuildContext secondaryContext;
  final Function callValidatorSetState;

  YesButton({this.id, this.secondaryContext, this.callValidatorSetState});

  @override
  _YesButtonState createState() => _YesButtonState();
}

class _YesButtonState extends State<YesButton> {
  Widget yesBtnWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        FontAwesomeIcons.check,
        color: Colors.white,
      ),
      SizedBox(
        width: 15.0,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          "Yes",
          style: TextStyle(fontSize: 22.0, color: Colors.white, fontFamily: Stem.medium),
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
    ],
  );

  Future<void> markScheduleCompleted(String scheduleID, BuildContext context) async {
    var body = {"id": scheduleID};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.markScheduleCompleted), body);

    if (response.success) {
      AwesomeDialog(
        context: widget.secondaryContext,
        dialogType: DialogType.SUCCES,
        btnOkColor: Color(0xFF00ca71),
        title: "Schedule marked as completed!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "Schedule with id $scheduleID marked as completed!",
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    } else {
      AwesomeDialog(
        context: widget.secondaryContext,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Failed to mark schedule as completed",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "Failed to mark schedule with id $scheduleID as completed!",
        btnOkOnPress: () {
          Navigator.pop(context);
        },
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          yesBtnWidget = SpinKitWave(
            color: Colors.white,
            size: 25.0,
          );
        });
        await markScheduleCompleted(widget.id, context);
        setState(() {
          yesBtnWidget = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
              ),
              SizedBox(
                width: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Yes",
                  style: TextStyle(fontSize: 22.0, color: Colors.white, fontFamily: Stem.medium),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
            ],
          );
        });
        Common.validatorBeneficiaryWidgetList = [EmptyBeneficiaryScheduleWidget()];

        widget.callValidatorSetState();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF6c63ff),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        width: 225.0,
        height: 50.0,
        child: yesBtnWidget,
      ),
    );
  }
}

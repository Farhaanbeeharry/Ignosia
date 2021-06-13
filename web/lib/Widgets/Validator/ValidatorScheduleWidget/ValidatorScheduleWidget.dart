import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ScheduleModel.dart';
import 'package:web/Widgets/Validator/ValidatorScheduleWidget/ValidatorScheduleWidgetController.dart';

class ValidatorScheduleWidget extends StatefulWidget {
  final ScheduleModel data;
  final Function callValidatorSetState;

  ValidatorScheduleWidget({this.data, this.callValidatorSetState});

  @override
  _ValidatorScheduleWidgetState createState() => _ValidatorScheduleWidgetState();
}

class _ValidatorScheduleWidgetState extends State<ValidatorScheduleWidget> {
  ValidatorScheduleController validatorScheduleController = new ValidatorScheduleController();

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
            color: Color(0xFFe1e1e1),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.3,
          height: 100.0,
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
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.data.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontFamily: Stem.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              'On ',
                              style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: Stem.light),
                            ),
                            Text(
                              widget.data.date,
                              style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: Stem.medium),
                            ),
                            Text(
                              ' at ',
                              style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: Stem.light),
                            ),
                            Text(
                              widget.data.time,
                              style: TextStyle(color: Colors.black, fontSize: 16.0, fontFamily: Stem.medium),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    setState(() {
                      validatorScheduleController.btnIcon = SpinKitWave(
                        color: Colors.white,
                        size: 25.0,
                      );
                    });
                    await validatorScheduleController.getBeneficiaries(widget.data.iD, widget.callValidatorSetState);
                    setState(() {
                      validatorScheduleController.btnIcon = Icon(
                        FontAwesomeIcons.angleDoubleRight,
                        size: 42.0,
                        color: Colors.white,
                      );
                    });
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
                    height: 70.0,
                    child: validatorScheduleController.btnIcon,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

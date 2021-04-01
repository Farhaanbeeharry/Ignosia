import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web/Common/Stem.dart';

class EmptyBeneficiaryScheduleWidget extends StatefulWidget {
  @override
  _EmptyBeneficiaryScheduleWidgetState createState() => _EmptyBeneficiaryScheduleWidgetState();
}

class _EmptyBeneficiaryScheduleWidgetState extends State<EmptyBeneficiaryScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.62,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/empty.svg",
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "Empty list...",
            style: TextStyle(color: Color(0xFF6c63ff), fontSize: 32.0, fontFamily: Stem.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Select a schedule to continue!",
            style: TextStyle(color: Colors.black, fontSize: 22.0, fontFamily: Stem.regular),
          ),
        ],
      ),
    );
  }
}

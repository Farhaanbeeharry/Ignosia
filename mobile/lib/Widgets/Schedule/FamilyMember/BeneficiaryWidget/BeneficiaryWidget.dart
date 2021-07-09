import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Common.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Model/BeneficiaryModel.dart';
import 'package:mobile/Widgets/Schedule/FamilyMember/BeneficiaryView/BeneficiaryView.dart';

class BeneficiaryWidget extends StatefulWidget {
  final BeneficiaryModel beneficiary;
  final Function mainSetState, loadData;

  BeneficiaryWidget({this.beneficiary, this.mainSetState, this.loadData});

  @override
  _BeneficiaryWidgetState createState() => _BeneficiaryWidgetState();
}

class _BeneficiaryWidgetState extends State<BeneficiaryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 100.0,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
            color: Color(0xff009a8c).withOpacity(0.8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.beneficiary.firstName + " " + widget.beneficiary.lastName,
                        style: TextStyle(color: Colors.white, fontSize: 24.0, fontFamily: Stem.medium),
                      ),
                      Text(
                        widget.beneficiary.firstName == 'New' && widget.beneficiary.lastName == 'family member' ? "Open to add details" : Common.getAge(widget.beneficiary.dateOfBirth) + " years old",
                        style: TextStyle(color: Colors.white, fontSize: 18.0, fontFamily: Stem.light),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BeneficiaryView(beneficiary: widget.beneficiary, loadData: widget.loadData)),
                    );
                  },
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF36d7b4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    child: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 15.0),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Stem.dart';

class BeneficiarySummaryWidget extends StatefulWidget {
  @override
  _BeneficiarySummaryWidgetState createState() => _BeneficiarySummaryWidgetState();
}

class _BeneficiarySummaryWidgetState extends State<BeneficiarySummaryWidget> {
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
          width: MediaQuery.of(context).size.width * 0.35,
          height: 120.0,
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 300.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Farhaan Beeharry',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontFamily: Stem.bold,
                          ),
                        ),
                        SizedBox(
                          height: 7.5,
                        ),
                        Text(
                          'James Anderson F., Port Louis',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Stem.light,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '57076881',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontFamily: Stem.light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Color(0xFF6c63ff),
                    ),
                    width: 60.0,
                    height: 120.0,
                    child: Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Colors.white,
                      size: 28.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

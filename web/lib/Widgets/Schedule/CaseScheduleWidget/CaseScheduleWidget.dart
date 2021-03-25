import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Stem.dart';

class CaseScheduleWidget extends StatefulWidget {
  @override
  _CaseScheduleWidgetState createState() => _CaseScheduleWidgetState();
}

class _CaseScheduleWidgetState extends State<CaseScheduleWidget> {
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
                          'Mr J. Dormi-enplass',
                          style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.bold),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Rte des pamplemousses, port louis',
                          style: TextStyle(fontSize: 16.0, color: Colors.black, fontFamily: Stem.medium),
                        ),
                        Text(
                          '59495577',
                          style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: Stem.regular),
                        ),
                        Text(
                          'Boug la ine met foss nom.. call li!',
                          style: TextStyle(fontSize: 14.0, color: Colors.black, fontFamily: Stem.regular),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
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
                    child: Icon(
                      FontAwesomeIcons.save,
                      size: 36.0,
                      color: Colors.white,
                    ),
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

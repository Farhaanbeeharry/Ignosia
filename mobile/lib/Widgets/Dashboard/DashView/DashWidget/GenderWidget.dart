import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile/Common/Stem.dart';

class DashboardWidget extends StatefulWidget {
  final String item, value;

  DashboardWidget({this.item, this.value});

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  getIcon(String item) {
    if (item == "Cases") {
      return Icon(
        FontAwesomeIcons.balanceScale,
        color: Colors.black,
        size: 36.0,
      );
    } else if (item == "Events") {
      return Icon(
        FontAwesomeIcons.wineGlassAlt,
        color: Colors.black,
        size: 36.0,
      );
    } else if (item == "Users") {
      return Icon(
        FontAwesomeIcons.userSecret,
        color: Colors.black,
        size: 36.0,
      );
    } else if (item == "Male") {
      return Icon(
        FontAwesomeIcons.mars,
        color: Colors.black,
        size: 36.0,
      );
    } else if (item == "Female") {
      return Icon(
        FontAwesomeIcons.venus,
        color: Colors.black,
        size: 36.0,
      );
    } else {
      return Icon(
        FontAwesomeIcons.transgenderAlt,
        color: Colors.black,
        size: 36.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Neumorphic(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              getIcon(widget.item),
              SizedBox(
                width: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    widget.item,
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: Stem.light),
                  ),
                  Text(
                    widget.value,
                    style: TextStyle(color: Colors.black, fontSize: 26.0, fontFamily: Stem.medium),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/BugModel.dart';
import 'package:web/Widgets/Analytics/BugReportedWidget/DetailedBugWidget/DetailedBugController.dart';

class DetailedBugWidget extends StatefulWidget {
  final BugModel data;
  final Function loadData;
  final Function callSetState;

  DetailedBugWidget({this.data, this.loadData, this.callSetState});

  @override
  _DetailedBugWidgetState createState() => _DetailedBugWidgetState();
}

class _DetailedBugWidgetState extends State<DetailedBugWidget> {
  DetailedBugController detailedBugController = new DetailedBugController();
  Widget markAsDoneBtnWidget = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        FontAwesomeIcons.checkCircle,
        color: Colors.white,
        size: 24.0,
      ),
      SizedBox(
        width: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          'Solved',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontFamily: Stem.regular,
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 600.0,
              width: 1200.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/bug.svg",
                    width: 300.0,
                  ),
                  SizedBox(
                    width: 125.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 600.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'View a bug',
                              style: TextStyle(fontSize: 54.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            widget.data.solved == "true"
                                ? Icon(
                                    FontAwesomeIcons.solidCheckCircle,
                                    size: 36.0,
                                    color: Colors.green,
                                  )
                                : Icon(
                                    FontAwesomeIcons.solidTimesCircle,
                                    size: 36.0,
                                    color: Colors.red,
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Container(
                          height: 125.0,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Date reported: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Text(
                                      Common.convertNormalDate(widget.data.date),
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                    ),
                                    Container(
                                      width: 450.0,
                                      child: Text(
                                        widget.data.description,
                                        style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50.0,
                              width: 300.0,
                              child: TextButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                child: Text(
                                  "Close",
                                  style: Common.buttonTextStyle,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Common.loggedInData.status == "admin" && widget.data.solved == 'false'
                                ? Container(
                                    height: 50.0,
                                    width: 200.0,
                                    child: TextButton(
                                      onPressed: () async {
                                        FocusScope.of(context).requestFocus(new FocusNode());

                                        setState(() {
                                          markAsDoneBtnWidget = SpinKitWave(
                                            color: Colors.white,
                                            size: 25.0,
                                          );
                                        });

                                        await detailedBugController.solveBug(widget.data.iD, context, widget.loadData, widget.callSetState);

                                        setState(() {
                                          markAsDoneBtnWidget = Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.checkCircle,
                                                color: Colors.white,
                                                size: 24.0,
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5.0),
                                                child: Text(
                                                  'Solved',
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white,
                                                    fontFamily: Stem.regular,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                      },
                                      style: TextButton.styleFrom(backgroundColor: Colors.green, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                      child: markAsDoneBtnWidget,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web/Common/API.dart';
import 'package:web/Common/ApiUrl.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Model/ResponseModel.dart';

class MemberWidgetController {
  bool confirmState = false;

  Widget deleteBtnWidget = Text(
    "Delete member",
    style: Common.buttonTextStyle,
  );

  Future<void> showDeleteWarning(String id, String name, String emailAddress, String phoneNumber, Function callSetState, Function callWidgetSetState, BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
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
                  height: 500.0,
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
                        "assets/images/delete.svg",
                        width: 300.0,
                      ),
                      SizedBox(
                        width: 125.0,
                      ),
                      Container(
                        width: 500.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Delete member',
                              style: TextStyle(fontSize: 54.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Full name: ',
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                ),
                                Text(
                                  name,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Email address: ',
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                ),
                                Text(
                                  emailAddress,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Phone number: ',
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.medium),
                                ),
                                Text(
                                  phoneNumber,
                                  style: TextStyle(fontSize: 20.0, color: Colors.black, fontFamily: Stem.regular),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.0,
                                  width: 275.0,
                                  child: TextButton(
                                    onPressed: () {
                                      FocusScope.of(context).requestFocus(new FocusNode());

                                      deleteBtnWidget = SpinKitWave(
                                        color: Colors.white,
                                        size: 25.0,
                                      );

                                      callWidgetSetState();
                                      deleteMember(id, name, callSetState, callWidgetSetState, context);
                                    },
                                    style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                    child: deleteBtnWidget,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 50.0,
                                  width: 215.0,
                                  child: TextButton(
                                    onPressed: () {
                                      FocusScope.of(context).requestFocus(new FocusNode());
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(backgroundColor: Colors.green, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                    child: Text(
                                      "Cancel",
                                      style: Common.buttonTextStyle,
                                    ),
                                  ),
                                ),
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
      },
    );
  }

  Future<void> deleteMember(String id, String name, Function callSetState, Function callWidgetSetState, BuildContext context) async {
    var body = {"memberID": id};

    ResponseModel response = await API().post(ApiUrl.getURL(ApiUrl.deleteMember), body);

    if (response.success) {
      int value;
      for (int i = 0; i < Common.memberList.length; i++) {
        if (Common.memberList[i].iD == id) {
          value = i;
          break;
        }
      }

      Common.memberList.removeAt(value);
      Common.memberWidgetList.removeAt(value);
      deleteBtnWidget = Text(
        "Delete member",
        style: Common.buttonTextStyle,
      );
      callWidgetSetState();
      callSetState();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        title: "Member deleted successfully!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: "Member '" + name + "' deleted successfully!",
        btnOkOnPress: () {
          Navigator.pop(context);
        },
        onDissmissCallback: () {},
      ).show();
    } else {
      deleteBtnWidget = Text(
        "Delete member",
        style: Common.buttonTextStyle,
      );
      callWidgetSetState();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        btnOkColor: Color(0xFFd93e47),
        title: "Deleting member failed!",
        width: MediaQuery.of(context).size.width * 0.4,
        dismissOnTouchOutside: true,
        desc: response.error,
        btnOkOnPress: () {},
      ).show();
    }
  }
}

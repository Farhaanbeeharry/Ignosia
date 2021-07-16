import 'package:Ignosia/Common/Stem.dart';
import 'package:Ignosia/Widgets/Compose/ComposeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ComposeView extends StatefulWidget {
  @override
  _ComposeViewState createState() => _ComposeViewState();
}

class _ComposeViewState extends State<ComposeView> {
  ComposeController composeController = new ComposeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecipientList();
  }

  getRecipientList() async {
    await composeController.loadRecipientList(context, callSetState);
  }

  callSetState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Text(
                    "Choose recipient",
                    style: TextStyle(fontSize: 28.0, fontFamily: Stem.bold),
                  ),
                  Spacer(),
                  Container(
                    height: 50.0,
                    width: 70.0,
                    child: NeumorphicButton(
                      onPressed: () async {
                        setState(() {
                          composeController.listLoaded = false;
                        });

                        await composeController.loadRecipientList(context, callSetState);

                        setState(() {
                          composeController.listLoaded = true;
                        });
                      },
                      child: Center(
                        child: composeController.listLoaded
                            ? Icon(
                                FontAwesomeIcons.sync,
                                size: 24.0,
                              )
                            : SpinKitWave(
                                color: Colors.black,
                                size: 24.0,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 185.0,
                child: SingleChildScrollView(
                    child: Column(
                  children: composeController.recipientWidgetList,
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

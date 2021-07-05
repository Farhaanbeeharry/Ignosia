import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobile/Common/Stem.dart';
import 'package:mobile/Widgets/Compose/RecipientWidget/RecipientWidget.dart';

class ComposeView extends StatefulWidget {
  @override
  _ComposeViewState createState() => _ComposeViewState();
}

class _ComposeViewState extends State<ComposeView> {
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
              Text(
                "Choose recipient",
                style: TextStyle(fontSize: 26.0, fontFamily: Stem.bold),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 185.0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RecipientWidget(
                        firstName: "Farhaan",
                        lastName: "Beeharry",
                        emailAddress: "farhaanbeeharry.ms@gmail.com",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

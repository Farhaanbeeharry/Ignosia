import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Beneficiary/BeneficiaryController.dart';
import 'package:web/Widgets/Beneficiary/EmptyBeneficiaryWidget/EmptyBeneficiaryWidget.dart';

class BeneficiaryView extends StatefulWidget {
  @override
  _BeneficiaryViewState createState() => _BeneficiaryViewState();
}

class _BeneficiaryViewState extends State<BeneficiaryView> {
  BeneficiaryController beneficiaryController = new BeneficiaryController();

  callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Common.selectedBeneficiary = false;
    Common.selectedBeneficiaryName = '';
    loadBeneficiaryData();
  }

  loadBeneficiaryData() async {
    await loadBeneficiaryList();
  }

  loadBeneficiaryList() async {
    setState(() {
      beneficiaryController.refreshBtnIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await beneficiaryController.getBeneficiaryList(callSetState, loadBeneficiaryData, context);
    setState(() {
      beneficiaryController.refreshBtnIcon = Icon(
        FontAwesomeIcons.syncAlt,
        color: Color(0xFF6c63ff),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.8) - 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 45.0, horizontal: 50.0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.83,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Beneficiary',
                      style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        Common.displayDate,
                        style: TextStyle(fontSize: 20.0, color: Color(0xFFa3b0cb), fontFamily: 'StemRegular'),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.33,
                      height: MediaQuery.of(context).size.height * 0.67,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Beneficiaries',
                                  style: TextStyle(fontSize: 28.0, color: Color(0xFF6c63ff), fontFamily: 'StemMedium'),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Container(
                                  width: 175.0,
                                  child: TextFormField(
                                    onChanged: (value) async {
                                      if (value.isEmpty) {
                                        await loadBeneficiaryData();
                                      } else {
                                        await beneficiaryController.displayResult(value, callSetState);
                                      }
                                    },
                                    style: Common.labelTextStyle,
                                    decoration: InputDecoration(
                                      border: new OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(15.0),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(top: 50.0, left: 20.0),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          FocusScope.of(context).requestFocus(new FocusNode());

                                          setState(() {
                                            beneficiaryController.searchController.clear();
                                            loadBeneficiaryData();
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          child: Container(
                                            width: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                              color: Color(0xFF6c63ff),
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.times,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      labelText: 'Search ...',
                                      labelStyle: Common.labelTextStyle,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    await loadBeneficiaryData();
                                  },
                                  child: Container(
                                    width: 70.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe1e1e1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    child: beneficiaryController.refreshBtnIcon,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.30,
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: Scrollbar(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: Common.beneficiaryWidgetList,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.33,
                height: MediaQuery.of(context).size.height * 0.83,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Common.selectedBeneficiaryName,
                        style: TextStyle(color: Color(0xFF6c63ff), fontSize: 36.0, fontFamily: Stem.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 470.0,
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: SingleChildScrollView(
                          child: Common.selectedBeneficiary == false ? EmptyBeneficiaryWidget() : Common.beneficiaryWidget,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

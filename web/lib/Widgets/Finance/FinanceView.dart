import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:validators/validators.dart';
import 'package:web/Common/Common.dart';
import 'package:web/Common/Stem.dart';
import 'package:web/Widgets/Finance/FinanceController.dart';

class Finance extends StatefulWidget {
  @override
  _FinanceState createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  FinanceController financeController = new FinanceController();

  callSetState() {
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransactionList();
    getBalance();
  }

  loadTransaction() async {
    await getTransactionList();
  }

  getBalance() async {
    setState(() {
      financeController.balanceRefreshBtn = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await financeController.getBalance();
    setState(() {
      financeController.balanceRefreshBtn = Icon(
        FontAwesomeIcons.syncAlt,
        color: Color(0xFF6c63ff),
      );
    });
  }

  getTransactionList() async {
    setState(() {
      financeController.refreshBtnIcon = SpinKitWave(
        color: Color(0xFF6c63ff),
        size: 25.0,
      );
    });
    await financeController.getTransactionList(callSetState, loadTransaction, getBalance);
    setState(() {
      financeController.refreshBtnIcon = Icon(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Finance',
                              style: TextStyle(fontSize: 48.0, color: Color(0XFF36317F), fontFamily: 'StemBold'),
                            ),
                            Text(
                              Common.displayDate,
                              style: TextStyle(fontSize: 20.0, color: Color(0xFFa3b0cb), fontFamily: 'StemRegular'),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 260.0,
                          height: 85.0,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15.0))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Balance',
                                      style: TextStyle(fontFamily: Stem.medium, color: Color(0xFF6c63ff), fontSize: 22.0),
                                    ),
                                    financeController.balanceWidget
                                  ],
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    getBalance();
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFe1e1e1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                    ),
                                    child: financeController.balanceRefreshBtn,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.0,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
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
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
                        child: Form(
                          key: financeController.newTransactionKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'New transaction',
                                style: TextStyle(fontSize: 32.0, color: Color(0xFF6c63ff), fontFamily: Stem.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                height: 350.0,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        validator: (name) {
                                          if (name.isEmpty) {
                                            return "Name cannot be empty!";
                                          } else if (name.length > 32) {
                                            return "Name is too long";
                                          } else
                                            return null;
                                        },
                                        controller: financeController.nameController,
                                        style: Common.labelTextStyle,
                                        decoration: InputDecoration(
                                          border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(15.0),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.only(top: 50.0),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Icon(FontAwesomeIcons.solidUser),
                                          ),
                                          labelText: 'Name of Person/Company',
                                          labelStyle: Common.labelTextStyle,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      TextFormField(
                                        validator: (description) {
                                          if (description.isEmpty) {
                                            return "Description cannot be empty!";
                                          } else if (description.length > 256) {
                                            return "Description is too long!";
                                          } else
                                            return null;
                                        },
                                        controller: financeController.descriptionController,
                                        style: Common.labelTextStyle,
                                        decoration: InputDecoration(
                                          border: new OutlineInputBorder(
                                            borderRadius: const BorderRadius.all(
                                              const Radius.circular(15.0),
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.only(top: 50.0),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Icon(FontAwesomeIcons.receipt),
                                          ),
                                          labelText: 'Description',
                                          labelStyle: Common.labelTextStyle,
                                        ),
                                        minLines: 4,
                                        maxLines: 4,
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              validator: (amount) {
                                                if (amount.isEmpty) {
                                                  return "Amount cannot be empty!";
                                                } else if (!isNumeric(amount)) {
                                                  return "Invalid amount!";
                                                } else if (int.parse(amount) <= 0) {
                                                  return "Invalid amount!";
                                                } else
                                                  return null;
                                              },
                                              controller: financeController.amountController,
                                              style: Common.labelTextStyle,
                                              decoration: InputDecoration(
                                                border: new OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(
                                                    const Radius.circular(15.0),
                                                  ),
                                                ),
                                                contentPadding: EdgeInsets.only(top: 50.0),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Icon(FontAwesomeIcons.coins),
                                                ),
                                                labelText: 'Amount (Rs)',
                                                labelStyle: Common.labelTextStyle,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!financeController.incomeBool) {
                                                setState(() {
                                                  financeController.incomeBool = !financeController.incomeBool;
                                                  financeController.expenseBool = !financeController.expenseBool;
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 110.0,
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: financeController.incomeBool ? financeController.enabledCheckBoxContainer : financeController.disabledCheckBoxContainer,
                                              ),
                                              child: Text(
                                                'Income',
                                                style: TextStyle(fontSize: 18.0, color: financeController.incomeBool ? financeController.enabledCheckBoxText : financeController.disabledCheckBoxText, fontFamily: Stem.regular),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!financeController.expenseBool) {
                                                setState(() {
                                                  financeController.incomeBool = !financeController.incomeBool;
                                                  financeController.expenseBool = !financeController.expenseBool;
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 110.0,
                                              height: 55.0,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: financeController.expenseBool ? financeController.enabledCheckBoxContainer : financeController.disabledCheckBoxContainer,
                                              ),
                                              child: Text(
                                                'Expense',
                                                style: TextStyle(fontSize: 18.0, color: financeController.expenseBool ? financeController.enabledCheckBoxText : financeController.disabledCheckBoxText, fontFamily: Stem.regular),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        color: Colors.black38,
                                        height: 1.0,
                                        width: 250.0,
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!financeController.cashBool) {
                                                setState(() {
                                                  financeController.cashBool = true;
                                                  financeController.chequeBool = false;
                                                  financeController.transferBool = false;
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: financeController.cashBool ? financeController.enabledCheckBoxContainer : financeController.disabledCheckBoxContainer,
                                              ),
                                              width: 140.0,
                                              height: 55.0,
                                              child: Text(
                                                'Cash',
                                                style: TextStyle(fontSize: 18.0, color: financeController.cashBool ? financeController.enabledCheckBoxText : financeController.disabledCheckBoxText, fontFamily: Stem.regular),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!financeController.chequeBool) {
                                                setState(() {
                                                  financeController.cashBool = false;
                                                  financeController.chequeBool = true;
                                                  financeController.transferBool = false;
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: financeController.chequeBool ? financeController.enabledCheckBoxContainer : financeController.disabledCheckBoxContainer,
                                              ),
                                              width: 140.0,
                                              height: 55.0,
                                              child: Text(
                                                'Cheque',
                                                style: TextStyle(fontSize: 18.0, color: financeController.chequeBool ? financeController.enabledCheckBoxText : financeController.disabledCheckBoxText, fontFamily: Stem.regular),
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            onTap: () {
                                              FocusScope.of(context).requestFocus(new FocusNode());

                                              if (!financeController.transferBool) {
                                                setState(() {
                                                  financeController.cashBool = false;
                                                  financeController.chequeBool = false;
                                                  financeController.transferBool = true;
                                                });
                                              }
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: financeController.transferBool ? financeController.enabledCheckBoxContainer : financeController.disabledCheckBoxContainer,
                                              ),
                                              width: 140.0,
                                              height: 55.0,
                                              child: Text(
                                                'Transfer',
                                                style: TextStyle(fontSize: 18.0, color: financeController.transferBool ? financeController.enabledCheckBoxText : financeController.disabledCheckBoxText, fontFamily: Stem.regular),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15.0),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50.0,
                                width: 500.0,
                                child: TextButton(
                                  onPressed: () async {
                                    FocusScope.of(context).requestFocus(new FocusNode());

                                    if (financeController.newTransactionKey.currentState.validate()) {
                                      setState(() {
                                        financeController.saveTransactionBtn = SpinKitWave(
                                          color: Colors.white,
                                          size: 25.0,
                                        );
                                      });

                                      await financeController.newTransaction(financeController.nameController.text, financeController.descriptionController.text, financeController.amountController.text, context, callSetState);
                                      getTransactionList();
                                      getBalance();
                                      setState(() {
                                        financeController.saveTransactionBtn = Text(
                                          'Save transaction',
                                          style: TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: Stem.regular),
                                        );
                                        financeController.amountController.clear();
                                        financeController.nameController.clear();
                                        financeController.descriptionController.clear();
                                        financeController.incomeBool = true;
                                        financeController.expenseBool = false;
                                        financeController.cashBool = true;
                                        financeController.chequeBool = false;
                                        financeController.transferBool = false;
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(backgroundColor: Color(0xFF3f3d56), shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0))),
                                  child: financeController.saveTransactionBtn,
                                ),
                              ),
                            ],
                          ),
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
                      Row(
                        children: [
                          Text(
                            "Transactions",
                            style: TextStyle(color: Color(0xFF6c63ff), fontSize: 40.0, fontFamily: Stem.bold),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              getTransactionList();
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
                              child: financeController.refreshBtnIcon,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        height: 470.0,
                        child: SingleChildScrollView(
                          child: Column(
                            children: Common.transactionWidgetList,
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
      ),
    );
  }
}

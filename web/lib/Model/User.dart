import 'package:web/Model/BaseClass.dart';

class User extends ReturnModel {
  String userID, firstName, lastName, emailAddress, password, dateOfBirth, location, userToken, deviceToken, accountType;
  int phoneNumber;

  @override
  ReturnModel cast(Map<String, dynamic> json) {
    this.userID = json['userID'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.emailAddress = json['emailAddress'];
    this.password = json['password'];
    this.dateOfBirth = json['dateOfBirth'];
    this.location = json['location'];
    this.userToken = json['userToken'];
    this.deviceToken = json['deviceToken'];
    this.accountType = json['accountType'];
    this.phoneNumber = json['phoneNumber'];
    return this;
  }
}

class UserModel {
  String iD;
  String firstName;
  String lastName;
  String emailAddress;
  String password;
  String dateOfBirth;
  String phoneNumber;
  String address;
  String userToken;
  String deviceToken;
  bool firstTimeUser;
  String webUser;
  String mobileUser;
  String resetKey;
  String status;

  UserModel({this.iD, this.firstName, this.lastName, this.emailAddress, this.password, this.dateOfBirth, this.phoneNumber, this.address, this.userToken, this.deviceToken, this.firstTimeUser, this.webUser, this.mobileUser, this.resetKey, this.status});

  UserModel fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    emailAddress = json['EmailAddress'];
    password = json['Password'];
    dateOfBirth = json['DateOfBirth'];
    phoneNumber = json['PhoneNumber'];
    address = json['Address'];
    userToken = json['UserToken'];
    deviceToken = json['DeviceToken'];
    firstTimeUser = json['FirstTimeUser'].toString().toString() == 'true';
    webUser = json['WebUser'];
    mobileUser = json['MobileUser'];
    resetKey = json['ResetKey'];
    status = json['Status'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['EmailAddress'] = this.emailAddress;
    data['Password'] = this.password;
    data['DateOfBirth'] = this.dateOfBirth;
    data['PhoneNumber'] = this.phoneNumber;
    data['Address'] = this.address;
    data['UserToken'] = this.userToken;
    data['DeviceToken'] = this.deviceToken;
    data['FirstTimeUser'] = this.firstTimeUser;
    data['WebUser'] = this.webUser;
    data['MobileUser'] = this.mobileUser;
    data['ResetKey'] = this.resetKey;
    data['Status'] = this.status;
    return data;
  }
}

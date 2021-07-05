class UserModel {
  String iD;
  String firstName;
  String lastName;
  String emailAddress;
  String dateOfBirth;
  String phoneNumber;
  String address;
  bool firstTimeUser;

  UserModel({this.iD, this.firstName, this.lastName, this.emailAddress, this.dateOfBirth, this.phoneNumber, this.address, this.firstTimeUser});

  UserModel fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    emailAddress = json['EmailAddress'];
    dateOfBirth = json['DateOfBirth'];
    phoneNumber = json['PhoneNumber'];
    address = json['Address'];
    firstTimeUser = json['FirstTimeUser'].toString().toString() == 'true';
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['EmailAddress'] = this.emailAddress;
    data['DateOfBirth'] = this.dateOfBirth;
    data['PhoneNumber'] = this.phoneNumber;
    data['Address'] = this.address;
    data['FirstTimeUser'] = this.firstTimeUser;

    return data;
  }
}

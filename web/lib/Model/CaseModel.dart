class CaseModel {
  String iD;
  String receivedByUserID;
  String dateReceived;
  String name;
  String phoneNumber;
  String location;
  String latitude;
  String longitude;
  String notes;
  String deleted;
  String scheduled;
  String firstName;
  String lastName;

  CaseModel({this.iD, this.receivedByUserID, this.dateReceived, this.name, this.phoneNumber, this.location, this.latitude, this.longitude, this.notes, this.deleted, this.scheduled, this.firstName, this.lastName});

  CaseModel fromJson(Map<String, dynamic> json) {
    this.iD = json['ID'];
    this.receivedByUserID = json['ReceivedByUserID'];
    this.dateReceived = json['DateReceived'];
    this.name = json['Name'];
    this.phoneNumber = json['PhoneNumber'];
    this.location = json['Location'];
    this.latitude = json['Latitude'];
    this.longitude = json['Longitude'];
    this.notes = json['Notes'];
    this.deleted = json['Deleted'];
    this.scheduled = json['Scheduled'];
    this.firstName = json['FirstName'];
    this.lastName = json['LastName'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ReceivedByUserID'] = this.receivedByUserID;
    data['DateReceived'] = this.dateReceived;
    data['Name'] = this.name;
    data['PhoneNumber'] = this.phoneNumber;
    data['Location'] = this.location;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Notes'] = this.notes;
    data['Deleted'] = this.deleted;
    data['Scheduled'] = this.scheduled;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    return data;
  }
}

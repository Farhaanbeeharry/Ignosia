class ScheduleModel {
  String iD;
  String createdByUserID;
  String assignedUserID;
  String caseID;
  String location;
  String latitude;
  String longitude;
  String date;
  String time;
  String name;
  String phoneNumber;
  String notes;
  String status;
  String deleted;
  String carriedOut;
  String createdByFirstName;
  String createdByLastName;
  String assignedToFirstName;
  String assignedToLastName;

  ScheduleModel({this.iD, this.createdByUserID, this.assignedUserID, this.caseID, this.location, this.latitude, this.longitude, this.date, this.time, this.name, this.phoneNumber, this.notes, this.status, this.deleted, this.carriedOut, this.createdByFirstName, this.createdByLastName, this.assignedToFirstName, this.assignedToLastName});

  ScheduleModel fromJson(Map<String, dynamic> json) {
    this.iD = json['ID'];
    this.createdByUserID = json['CreatedByUserID'];
    this.assignedUserID = json['AssignedUserID'];
    this.caseID = json['CaseID'];
    this.location = json['Location'];
    this.latitude = json['Latitude'];
    this.longitude = json['Longitude'];
    this.date = json['Date'];
    this.time = json['Time'];
    this.name = json['Name'];
    this.phoneNumber = json['PhoneNumber'];
    this.notes = json['Notes'];
    this.status = json['Status'];
    this.deleted = json['Deleted'];
    this.carriedOut = json['CarriedOut'];
    this.createdByFirstName = json['CreatedByFirstName'];
    this.createdByLastName = json['CreatedByLastName'];
    this.assignedToFirstName = json['AssignedToFirstName'];
    this.assignedToLastName = json['AssignedToLastName'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedByUserID'] = this.createdByUserID;
    data['AssignedUserID'] = this.assignedUserID;
    data['CaseID'] = this.caseID;
    data['Location'] = this.location;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['Date'] = this.date;
    data['Time'] = this.time;
    data['Name'] = this.name;
    data['PhoneNumber'] = this.phoneNumber;
    data['Notes'] = this.notes;
    data['Status'] = this.status;
    data['Deleted'] = this.deleted;
    data['CarriedOut'] = this.carriedOut;
    data['CreatedByFirstName'] = this.createdByFirstName;
    data['CreatedByLastName'] = this.createdByLastName;
    data['AssignedToFirstName'] = this.assignedToFirstName;
    data['AssignedToLastName'] = this.assignedToLastName;
    return data;
  }
}

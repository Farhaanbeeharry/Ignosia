class ScheduleModel {
  String iD;
  String createdByUserID;
  String assignedUserID;
  String caseID;
  String scheduleName;
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
  String validated;

  ScheduleModel({this.iD, this.createdByUserID, this.assignedUserID, this.caseID, this.scheduleName, this.location, this.latitude, this.longitude, this.date, this.time, this.name, this.phoneNumber, this.notes, this.status, this.deleted, this.carriedOut, this.validated});

  ScheduleModel fromJson(Map<String, dynamic> json) {
    this.iD = json['ID'];
    this.createdByUserID = json['CreatedByUserID'];
    this.assignedUserID = json['AssignedUserID'];
    this.caseID = json['CaseID'];
    this.scheduleName = json['ScheduleName'];
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
    this.validated = json['Validated'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedByUserID'] = this.createdByUserID;
    data['AssignedUserID'] = this.assignedUserID;
    data['CaseID'] = this.caseID;
    data['ScheduleName'] = this.scheduleName;
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
    data['Validated'] = this.validated;
    return data;
  }
}

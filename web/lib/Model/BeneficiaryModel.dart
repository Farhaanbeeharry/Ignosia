class BeneficiaryModel {
  String iD;
  String scheduleID;
  String firstName;
  String lastName;
  String age;
  String gender;
  String nationalID;
  String dateOfBirth;
  String location;
  String latitude;
  String longitude;
  String responsiblePartyName;
  String responsiblePartyRelationship;
  String qualificationYear;
  String school;
  String university;
  String skill;
  String workExperience;
  String workingCapabilities;
  String currentWorkplace;
  String currentWorkplaceRole;
  String maritalStatus;
  String policeRecord;
  String receivesPension;
  String socialAid;
  String homePhone;
  String mobilePhone;
  String workFromDate;
  String workToDate;
  String salary;
  String numberOfChildren;
  String notes;
  String status;
  String validated;
  String rejected;

  BeneficiaryModel({this.iD, this.scheduleID, this.firstName, this.lastName, this.age, this.gender, this.nationalID, this.dateOfBirth, this.location, this.latitude, this.longitude, this.responsiblePartyName, this.responsiblePartyRelationship, this.qualificationYear, this.school, this.university, this.skill, this.workExperience, this.workingCapabilities, this.currentWorkplace, this.currentWorkplaceRole, this.maritalStatus, this.policeRecord, this.receivesPension, this.socialAid, this.homePhone, this.mobilePhone, this.workFromDate, this.workToDate, this.salary, this.numberOfChildren, this.notes, this.status, this.validated, this.rejected});

  BeneficiaryModel fromJson(Map<String, dynamic> json) {
    this.iD = json['ID'];
    this.scheduleID = json['ScheduleID'];
    this.firstName = json['FirstName'];
    this.lastName = json['LastName'];
    this.age = json['Age'];
    this.gender = json['Gender'];
    this.nationalID = json['NationalID'];
    this.dateOfBirth = json['DateOfBirth'];
    this.location = json['Location'];
    this.latitude = json['Latitude'];
    this.longitude = json['Longitude'];
    this.responsiblePartyName = json['ResponsiblePartyName'];
    this.responsiblePartyRelationship = json['ResponsiblePartyRelationship'];
    this.qualificationYear = json['QualificationYear'];
    this.school = json['School'];
    this.university = json['University'];
    this.skill = json['Skill'];
    this.workExperience = json['WorkExperience'];
    this.workingCapabilities = json['WorkingCapabilities'];
    this.currentWorkplace = json['CurrentWorkplace'];
    this.currentWorkplaceRole = json['CurrentWorkplaceRole'];
    this.maritalStatus = json['MaritalStatus'];
    this.policeRecord = json['PoliceRecord'];
    this.receivesPension = json['ReceivesPension'];
    this.socialAid = json['SocialAid'];
    this.homePhone = json['HomePhone'];
    this.mobilePhone = json['MobilePhone'];
    this.workFromDate = json['WorkFromDate'];
    this.workToDate = json['WorkToDate'];
    this.salary = json['Salary'];
    this.numberOfChildren = json['NumberOfChildren'];
    this.notes = json['Notes'];
    this.status = json['status'];
    this.validated = json['Validated'];
    this.rejected = json['Rejected'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ScheduleID'] = this.scheduleID;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Age'] = this.age;
    data['Gender'] = this.gender;
    data['NationalID'] = this.nationalID;
    data['DateOfBirth'] = this.dateOfBirth;
    data['Location'] = this.location;
    data['Latitude'] = this.latitude;
    data['Longitude'] = this.longitude;
    data['ResponsiblePartyName'] = this.responsiblePartyName;
    data['ResponsiblePartyRelationship'] = this.responsiblePartyRelationship;
    data['QualificationYear'] = this.qualificationYear;
    data['School'] = this.school;
    data['University'] = this.university;
    data['Skill'] = this.skill;
    data['WorkExperience'] = this.workExperience;
    data['WorkingCapabilities'] = this.workingCapabilities;
    data['CurrentWorkplace'] = this.currentWorkplace;
    data['CurrentWorkplaceRole'] = this.currentWorkplaceRole;
    data['MaritalStatus'] = this.maritalStatus;
    data['PoliceRecord'] = this.policeRecord;
    data['ReceivesPension'] = this.receivesPension;
    data['SocialAid'] = this.socialAid;
    data['HomePhone'] = this.homePhone;
    data['MobilePhone'] = this.mobilePhone;
    data['WorkFromDate'] = this.workFromDate;
    data['WorkToDate'] = this.workToDate;
    data['Salary'] = this.salary;
    data['NumberOfChildren'] = this.numberOfChildren;
    data['Notes'] = this.notes;
    data['status'] = this.status;
    data['Validated'] = this.validated;
    data['Rejected'] = this.rejected;
    return data;
  }
}

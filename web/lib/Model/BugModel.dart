class BugModel {
  String iD;
  String reportedBy;
  String description;
  String date;
  String solved;

  BugModel({this.iD, this.reportedBy, this.description, this.date, this.solved});

  BugModel fromJson(Map<String, dynamic> json) {
    this.iD = json['ID'];
    this.reportedBy = json['ReportedBy'];
    this.description = json['Description'];
    this.date = json['Date'];
    this.solved = json['Solved'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ReportedBy'] = this.reportedBy;
    data['Description'] = this.description;
    data['Date'] = this.date;
    data['Solved'] = this.solved;
    return data;
  }
}

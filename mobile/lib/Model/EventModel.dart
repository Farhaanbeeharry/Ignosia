class EventModel {
  String iD;
  String createdByUserID;
  String eventName;
  String eventSponsor;
  String date;
  String time;
  String benefittedPeople;
  String description;
  String cost;
  String deleted;

  EventModel({this.iD, this.createdByUserID, this.eventName, this.eventSponsor, this.date, this.time, this.benefittedPeople, this.description, this.cost, this.deleted});

  EventModel fromJson(Map<String, dynamic> json) {
    this.iD = json['ID'];
    this.createdByUserID = json['CreatedByUserID'];
    this.eventName = json['EventName'];
    this.eventSponsor = json['EventSponsor'];
    this.date = json['Date'];
    this.time = json['Time'];
    this.benefittedPeople = json['BenefittedPeople'];
    this.description = json['Description'];
    this.cost = json['Cost'];
    this.deleted = json['Deleted'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['CreatedByUserID'] = this.createdByUserID;
    data['EventName'] = this.eventName;
    data['EventSponsor'] = this.eventSponsor;
    data['Date'] = this.date;
    data['Time'] = this.time;
    data['BenefittedPeople'] = this.benefittedPeople;
    data['Description'] = this.description;
    data['Cost'] = this.cost;
    data['Deleted'] = this.deleted;
    return data;
  }
}

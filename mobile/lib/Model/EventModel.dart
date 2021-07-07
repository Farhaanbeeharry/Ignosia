class EventModel {
  String id;
  String createdBy;
  String eventName;
  String eventSponsor;
  String date;
  String time;
  String benefittedPeople;
  String description;
  String cost;
  String firstName;
  String lastName;
  String deleted;

  EventModel({this.id, this.createdBy, this.eventName, this.eventSponsor, this.date, this.time, this.benefittedPeople, this.description, this.cost, this.firstName, this.lastName, this.deleted});

  EventModel fromJson(Map<String, dynamic> json) {
    this.id = json['ID'];
    this.createdBy = json['CreatedByUserID'];
    this.eventName = json['EventName'];
    this.eventSponsor = json['EventSponsor'];
    this.date = json['Date'];
    this.time = json['Time'];
    this.benefittedPeople = json['BenefittedPeople'];
    this.description = json['Description'];
    this.cost = json['Cost'];
    this.firstName = json['FirstName'];
    this.lastName = json['LastName'];
    this.deleted = json['Deleted'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['CreatedByUserID'] = this.createdBy;
    data['EventName'] = this.eventName;
    data['EventSponsor'] = this.eventSponsor;
    data['Date'] = this.date;
    data['Time'] = this.time;
    data['BenefittedPeople'] = this.benefittedPeople;
    data['Description'] = this.description;
    data['Cost'] = this.cost;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Deleted'] = this.deleted;
    return data;
  }
}

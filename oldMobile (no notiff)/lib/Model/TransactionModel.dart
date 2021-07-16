class TransactionModel {
  String id;
  String userID;
  String name;
  String description;
  String amount;
  String date;
  String type;
  String method;
  String deleted;

  TransactionModel({this.id, this.userID, this.name, this.description, this.amount, this.date, this.type, this.method, this.deleted});

  TransactionModel fromJson(Map<String, dynamic> json) {
    this.id = json['ID'];
    this.userID = json['UserID'];
    this.name = json['Name'];
    this.description = json['Description'];
    this.amount = json['Amount'];
    this.date = json['Date'];
    this.type = json['Type'];
    this.method = json['Method'];
    this.deleted = json['Deleted'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['UserID'] = this.userID;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Amount'] = this.amount;
    data['Date'] = this.date;
    data['Type'] = this.type;
    data['Method'] = this.method;
    data['Deleted'] = this.deleted;
    return data;
  }
}

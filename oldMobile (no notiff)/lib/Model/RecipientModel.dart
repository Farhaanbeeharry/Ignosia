class RecipientModel {
  String id;
  String firstName;
  String lastName;
  String emailAddress;

  RecipientModel({this.id, this.firstName, this.lastName, this.emailAddress});

  RecipientModel fromJson(Map<String, dynamic> json) {
    this.id = json['ID'];
    this.firstName = json['FirstName'];
    this.lastName = json['LastName'];
    this.emailAddress = json['EmailAddress'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.id;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['EmailAddress'] = this.emailAddress;
    return data;
  }
}

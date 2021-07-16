class DashboardModel {
  int male;
  int female;
  int other;
  int cases;
  int events;
  int users;

  DashboardModel({this.male, this.female, this.other, this.cases, this.events, this.users});

  DashboardModel fromJson(Map<String, dynamic> json) {
    this.male = json['male'];
    this.female = json['female'];
    this.other = json['other'];
    this.cases = json['cases'];
    this.events = json['events'];
    this.users = json['users'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['male'] = this.male;
    data['female'] = this.female;
    data['other'] = this.other;
    data['cases'] = this.cases;
    data['events'] = this.events;
    data['users'] = this.users;
    return data;
  }
}

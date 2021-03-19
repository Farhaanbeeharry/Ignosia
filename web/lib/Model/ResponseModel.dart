class ResponseModel {
  bool success;
  String error;
  String data;
  String msg;

  ResponseModel({this.success, this.error, this.data, this.msg});

  ResponseModel cast(Map<String, dynamic> json) {
    this.success = json['success'];
    this.error = json['error'];
    this.data = json['data'];
    this.msg = json['msg'];
    return this;
  }

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    data = json['data'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    data['data'] = this.data;
    data['msg'] = this.msg;
    return data;
  }
}

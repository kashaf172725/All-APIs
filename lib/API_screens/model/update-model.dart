class update_model {
  String? message;
  String? error;
  int? statusCode;

  update_model({this.message, this.error, this.statusCode});

  update_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['error'] = this.error;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

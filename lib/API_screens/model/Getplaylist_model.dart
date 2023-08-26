class Getplaylistmodel {
  List<Data>? data;
  String? message;
  int? statusCode;
  bool? success;

  Getplaylistmodel({this.data, this.message, this.statusCode, this.success});

  Getplaylistmodel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    statusCode = json['StatusCode'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['StatusCode'] = this.statusCode;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Videos>? videos;

  Data({this.id, this.name, this.createdAt, this.updatedAt, this.videos});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  String? id;
  String? videoLink;
  String? name;
  int? order;
  String? createdAt;
  String? updatedAt;

  Videos(
      {this.id,
      this.videoLink,
      this.name,
      this.order,
      this.createdAt,
      this.updatedAt});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoLink = json['videoLink'];
    name = json['name'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['videoLink'] = this.videoLink;
    data['name'] = this.name;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

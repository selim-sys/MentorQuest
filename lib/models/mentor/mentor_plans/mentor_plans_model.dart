class MentorPlansModel {
  bool? success;
  int? status;
  String? message;
  Data? data;

  MentorPlansModel({this.success, this.status, this.message, this.data});

  MentorPlansModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Standard? standard;
  Standard? pro;
  Standard? perSession;

  Data({this.standard, this.pro, this.perSession});

  Data.fromJson(Map<String, dynamic> json) {
    standard = json['standard'] != null
        ? new Standard.fromJson(json['standard'])
        : null;
    pro = json['pro'] != null ? new Standard.fromJson(json['pro']) : null;
    perSession = json['per_session'] != null
        ? new Standard.fromJson(json['per_session'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.standard != null) {
      data['standard'] = this.standard!.toJson();
    }
    if (this.pro != null) {
      data['pro'] = this.pro!.toJson();
    }
    if (this.perSession != null) {
      data['per_session'] = this.perSession!.toJson();
    }
    return data;
  }
}

class Standard {
  int? planId;
  int? mentorId;
  int? price;
  int? noSessions;
  String? responseTime;
  String? chat;
  String? description;

  Standard(
      {this.planId,
        this.mentorId,
        this.price,
        this.noSessions,
        this.responseTime,
        this.chat,
        this.description});

  Standard.fromJson(Map<String, dynamic> json) {
    planId = json['plan_id'];
    mentorId = json['mentor_id'];
    price = json['price'];
    noSessions = json['no_sessions'];
    responseTime = json['response_time'];
    chat = json['chat'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plan_id'] = this.planId;
    data['mentor_id'] = this.mentorId;
    data['price'] = this.price;
    data['no_sessions'] = this.noSessions;
    data['response_time'] = this.responseTime;
    data['chat'] = this.chat;
    data['description'] = this.description;
    return data;
  }
}

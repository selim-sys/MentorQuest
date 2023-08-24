class MentorAppointmentsModel {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;

  MentorAppointmentsModel({this.success, this.status, this.message, this.data});

  MentorAppointmentsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? menteeId;
  int? mentorId;
  int? planId;
  String? planType;
  String? status;
  String? date;
  String? startTime;
  String? cancellReason;
  bool? isPinnedMentor;
  String? createdAt;
  Mentee? mentee;

  Data(
      {this.id,
        this.menteeId,
        this.mentorId,
        this.planId,
        this.planType,
        this.status,
        this.date,
        this.startTime,
        this.cancellReason,
        this.isPinnedMentor,
        this.createdAt,
        this.mentee});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    menteeId = json['mentee_id'];
    mentorId = json['mentor_id'];
    planId = json['plan_id'];
    planType = json['plan_type'];
    status = json['status'];
    date = json['date'];
    startTime = json['start_time'];
    cancellReason = json['cancell_reason'];
    isPinnedMentor = json['is_pinned_mentor'];
    createdAt = json['created_at'];
    mentee =
    json['mentee'] != null ? new Mentee.fromJson(json['mentee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mentee_id'] = this.menteeId;
    data['mentor_id'] = this.mentorId;
    data['plan_id'] = this.planId;
    data['plan_type'] = this.planType;
    data['status'] = this.status;
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['cancell_reason'] = this.cancellReason;
    data['is_pinned_mentor'] = this.isPinnedMentor;
    data['created_at'] = this.createdAt;
    if (this.mentee != null) {
      data['mentee'] = this.mentee!.toJson();
    }
    return data;
  }
}

class Mentee {
  String? fname;
  String? lname;
  String? username;
  String? email;
  String? image;

  Mentee({this.fname, this.lname, this.username, this.email, this.image});

  Mentee.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}

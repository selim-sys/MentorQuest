class BookingDetailsModel {
  bool? success;
  int? status;
  String? message;
  Data? data;

  BookingDetailsModel({this.success, this.status, this.message, this.data});

  BookingDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? menteeId;
  int? mentorId;
  int? planId;
  String? planType;
  String? status;
  String? date;
  String? message1;
  String? message2;
  String? message3;
  String? message4;
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
        this.message1,
        this.message2,
        this.message3,
        this.message4,
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
    message1 = json['message_1'];
    message2 = json['message_2'];
    message3 = json['message_3'];
    message4 = json['message_4'];
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
    data['message_1'] = this.message1;
    data['message_2'] = this.message2;
    data['message_3'] = this.message3;
    data['message_4'] = this.message4;
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

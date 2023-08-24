class MentorCreateMeetingModel {
  bool? success;
  int? status;
  String? message;
  Data? data;

  MentorCreateMeetingModel({this.success, this.status, this.message, this.data});

  MentorCreateMeetingModel.fromJson(Map<String, dynamic> json) {
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
  int? mentorId;
  String? menteeId;
  String? bookingId;
  int? meetingId;
  String? topic;
  String? startTime;
  int? duration;
  String? password;
  String? startUrl;
  String? joinUrl;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.mentorId,
        this.menteeId,
        this.bookingId,
        this.meetingId,
        this.topic,
        this.startTime,
        this.duration,
        this.password,
        this.startUrl,
        this.joinUrl,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    mentorId = json['mentor_id'];
    menteeId = json['mentee_id'];
    bookingId = json['booking_id'];
    meetingId = json['meeting_id'];
    topic = json['topic'];
    startTime = json['start_time'];
    duration = json['duration'];
    password = json['password'];
    startUrl = json['start_url'];
    joinUrl = json['join_url'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mentor_id'] = this.mentorId;
    data['mentee_id'] = this.menteeId;
    data['booking_id'] = this.bookingId;
    data['meeting_id'] = this.meetingId;
    data['topic'] = this.topic;
    data['start_time'] = this.startTime;
    data['duration'] = this.duration;
    data['password'] = this.password;
    data['start_url'] = this.startUrl;
    data['join_url'] = this.joinUrl;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

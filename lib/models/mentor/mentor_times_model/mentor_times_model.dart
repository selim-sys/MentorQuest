class MentorStoreTimesModel {
  bool? success;
  int? status;
  String? message;
  Data? data;


  MentorStoreTimesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  int? mentorId;
  String? day;
  String? from;
  String? to;
  String? updatedAt;
  String? createdAt;
  int? id;


  Data.fromJson(Map<String, dynamic> json) {
    mentorId = json['mentor_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }


}

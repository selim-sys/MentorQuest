class MentorGetTimesModel {
  bool? success;
  int? status;
  String? message;
  List<Data>? data;



  MentorGetTimesModel.fromJson(Map<String, dynamic> json) {
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


}

class Data {
  int? id;
  int? mentorId;
  String? day;
  String? from;
  String? to;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mentorId = json['mentor_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
  }

 
}

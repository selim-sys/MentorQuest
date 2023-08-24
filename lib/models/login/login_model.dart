class ConsultLoginModel {
  bool? success;
  int? status;
  String? message;
  String? token;

  ConsultLoginModel.fromJson(Map<String, dynamic> json)
  {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    token = json['data'];
  }

}
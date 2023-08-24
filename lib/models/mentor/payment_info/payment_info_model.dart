class MentorPaymentInfoModel {
  bool? success;
  int? status;
  String? message;
  Data? data;

  MentorPaymentInfoModel({this.success, this.status, this.message, this.data});

  MentorPaymentInfoModel.fromJson(Map<String, dynamic> json) {
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
  String? holderName;
  String? routingNumber;
  String? accountNumber;
  int? userId;
  String? userType;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.holderName,
        this.routingNumber,
        this.accountNumber,
        this.userId,
        this.userType,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    holderName = json['holder_name'];
    routingNumber = json['routing_number'];
    accountNumber = json['account_number'];
    userId = json['user_id'];
    userType = json['user_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holder_name'] = this.holderName;
    data['routing_number'] = this.routingNumber;
    data['account_number'] = this.accountNumber;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

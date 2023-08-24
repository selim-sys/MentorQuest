class MentorDashboardModel {
  bool? success;
  int? status;
  String? message;
  Data? data;

  MentorDashboardModel({this.success, this.status, this.message, this.data});

  MentorDashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }


}

class Data {
  PersonalCard? personalCard;
  Statistics? statistics;

  Data({this.personalCard, this.statistics});

  Data.fromJson(Map<String, dynamic> json) {
    personalCard = json['personal_card'] != null ? new PersonalCard.fromJson(json['personal_card']) : null;
    statistics = json['statistics'] != null ? new Statistics.fromJson(json['statistics']) : null;
  }
}

class PersonalCard {
  String? name;
  String? photo;
  double? progress;
  double? rating;

  PersonalCard({this.name, this.photo, this.progress, this.rating});

  PersonalCard.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    progress = double.parse(json['progress'].toString());
    rating = double.parse(json['rating'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['progress'] = this.progress;
    data['rating'] = this.rating;
    return data;
  }
}

class Statistics {
  int? members;
  int? appointments;
  int? money;

  Statistics({this.members, this.appointments, this.money});

  Statistics.fromJson(Map<String, dynamic> json) {
    members = json['members'];
    appointments = json['appointments'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['members'] = this.members;
    data['appointments'] = this.appointments;
    data['money'] = this.money;
    return data;
  }
}









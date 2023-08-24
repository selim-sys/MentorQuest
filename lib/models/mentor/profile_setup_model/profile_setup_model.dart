class ProfileSetupModel {
  bool? success;
  int? status;
  String? message;
  ProfileData? data;

  ProfileSetupModel({this.success, this.status, this.message, this.data});

  ProfileSetupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  String? jobTitle;
  String? company;
  String? category;
  String? skills;
  String? experience;
  int? yearsOfExperience;
  String? gender;
  String? country;
  String? city;
  String? address;
  String? zipCode;
  String? birthDate;
  String? bio;

  ProfileData(
      {this.jobTitle,
        this.company,
        this.category,
        this.skills,
        this.experience,
        this.yearsOfExperience,
        this.gender,
        this.country,
        this.city,
        this.address,
        this.zipCode,
        this.birthDate,
        this.bio});

  ProfileData.fromJson(Map<String, dynamic> json) {
    jobTitle = json['job_title'];
    company = json['company'];
    category = json['category'];
    skills = json['skills'];
    experience = json['experience'];
    yearsOfExperience = json['years_of_experience'];
    gender = json['gender'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    zipCode = json['zip_code'];
    birthDate = json['birth_date'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_title'] = this.jobTitle;
    data['company'] = this.company;
    data['category'] = this.category;
    data['skills'] = this.skills;
    data['experience'] = this.experience;
    data['years_of_experience'] = this.yearsOfExperience;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['zip_code'] = this.zipCode;
    data['birth_date'] = this.birthDate;
    data['bio'] = this.bio;
    return data;
  }
}

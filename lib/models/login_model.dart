class AppLoginModel {
  bool? status;
  String? message;
  Data? data;

  AppLoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {

  String? firstName;
  String? lastName;
  String? username;
  String? country;
  String? dateOfBirth;
  String? gender;
  String? email;
  String? phone;
  String? token;

  Data.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    country = json['country'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
  }
}
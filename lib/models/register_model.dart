class Register_model {
  bool? status;
  String? message;
  Data? data;

  Register_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  String? gender;
  String? country;
  String? dateOfBirth;

  Data.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    country = json['country'];
    dateOfBirth = json['date_of_birth'];
  }
}
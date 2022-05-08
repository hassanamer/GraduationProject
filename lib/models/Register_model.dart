class Register_model {
  bool? status;
  String? message;
  Data? data;

  Register_model({this.status, this.message, this.data});

  Register_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
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

  Data(
      {this.firstName,
        this.lastName,
        this.username,
        this.email,
        this.phone,
        this.gender,
        this.country,
        this.dateOfBirth});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['date_of_birth'] = this.dateOfBirth;
    return data;
  }
}
class RegisterModel {
  late final bool status;
  late final String message;
  late final Data data;

  RegisterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

}

class Data {
  late final String firstName;
  late final String lastName;
  late final String username;
  late final String email;
  late final String phone;
  late final String gender;
  late final String country;
  late final String dateOfBirth;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    country = json['country'];
    dateOfBirth = json['date_of_birth'];
    token = json['token'];
  }

}
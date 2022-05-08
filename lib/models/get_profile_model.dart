class GetProfileModel {
  late final bool status;
  late final String message;
  late final Data data;

  GetProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final String firstName;
  late final String lastName;
  late final String username;
  late final String country;
  late final String dateOfBirth;
  late final String gender;
  late final String email;
  late final String phone;
  late final String token;

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
class LoginModel {
  late final bool status;
  late final String message;
  late final Data data;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final String email;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    token = json['token'];
  }
}
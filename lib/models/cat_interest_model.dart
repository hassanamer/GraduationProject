class ChangeInterestModel {
  late final bool status;
  late final String message;

  ChangeInterestModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}
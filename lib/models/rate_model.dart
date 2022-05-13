class RateModel {
  late final bool status;
  late final String message;

  RateModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}
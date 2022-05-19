class ResetPasswordModel {

  late final bool status;
  late final String messege;

  ResetPasswordModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    messege = json['messege'];
  }

}
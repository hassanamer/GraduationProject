class ChangePasswordModel {
  late final bool status;
  late final String success;

  ChangePasswordModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    success = json['success'];
  }
}
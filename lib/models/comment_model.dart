class CommentModel {
  late final bool status;
  late final String message;

  CommentModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}
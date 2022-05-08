class PlaceDetailsModel {
  bool? status;
  String? message;
  Data? data;

  PlaceDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

}

class Data {
  dynamic id;
  String? placeName;
  String? Description;
  String? location;
  String? image;
  bool? isActive;
  late final dynamic rate;
  bool? inFavourite;
  List<dynamic>? comments;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    placeName = json['place_name'];
    Description = json['Description'];
    location = json['location'];
    image = json['image'];
    isActive = json['is_active'];
    rate = json['rate'];
    inFavourite = json['in_favourite'];
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
  }
}
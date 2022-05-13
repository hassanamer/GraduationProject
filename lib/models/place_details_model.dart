class PlaceDetailsModel {
  late final bool status;
  late final String message;
  late final Data data;

  PlaceDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final dynamic id;
  late final String placeName;
  late final String Description;
  late final dynamic city;
  late final String location;
  late final String image;
  late final bool isActive;
  late final dynamic rate;
  late final bool inFavourite;
  late final List<Comments> comments;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    placeName = json['place_name'];
    Description = json['Description'];
    city = json['city'];
    location = json['location'];
    image = json['image'];
    isActive = json['is_active'];
    rate = json['rate'];
    inFavourite = json['in_favourite'];
    comments = List.from(json['comments']).map((e)=>Comments.fromJson(e)).toList();
  }
}

class Comments {
  late final dynamic id;
  late final String user;
  late final String comment;

  Comments.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = json['user'];
    comment = json['comment'];
  }
}
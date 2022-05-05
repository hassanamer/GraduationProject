class SearchModel {
  bool? status;
  String? message;
  Data? data;

  SearchModel.fromJson(Map<String?, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<Places>? places;

  Data.fromJson(Map<String?, dynamic> json){
    places = List.from(json['places']).map((e)=>Places.fromJson(e)).toList();
  }
}

class Places {
  dynamic id;
  String? placeName;
  String? Description;
  String? location;
  String? image;
  bool? isActive;
  dynamic rate;
  bool? inFavourite;

  Places.fromJson(Map<String?, dynamic> json){
    id = json['id'];
    placeName = json['place_name'];
    Description = json['Description'];
    location = json['location'];
    image = json['image'];
    isActive = json['is_active'];
    rate = json['rate'];
    inFavourite = json['in_favourite'];
  }

}
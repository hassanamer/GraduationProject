class CpModel {
  late final bool status;
  late final String message;
  late final Data data;

  CpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}
class Data {
  late final List<Category> category;

  Data.fromJson(Map<String, dynamic> json){
    category = List.from(json['category']).map((e)=>Category.fromJson(e)).toList();
  }
}

class Category {
  late final String name;
  late final Info info;

  Category.fromJson(Map<String, dynamic> json){
    name = json['name'];
    info = Info.fromJson(json['info']);
  }
}

class Info {
  late final List<Places> places;

  Info.fromJson(Map<String, dynamic> json){
    places = List.from(json['places']).map((e) => Places.fromJson(e)).toList();
  }

}

class Places {
  late final dynamic id;
  late final String placeName;
  late final String Description;
  late final String location;

  late final String image;
  late final bool isActive;
  late final dynamic rate;
  late final bool inFavourite;

  Places.fromJson(Map<String, dynamic> json){
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
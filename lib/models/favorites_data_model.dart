class GetFavoritesModel {
  late final bool status;
  late final String messege;
  late final Data data;

  GetFavoritesModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    messege = json['messege'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<Places> places;

  Data.fromJson(Map<String, dynamic> json){
    places = List.from(json['places']).map((e)=>Places.fromJson(e)).toList();
  }
}

class Places {
  late final dynamic id;
  late final String placeName;
  late final dynamic type;
  late final String ageCategory;
  late final String Description;
  late final String city;
  late final String priceClass;
  late final String location;
  late final String image;
  late final bool isActive;
  late final dynamic rate;
  late final bool inFavourite;

  Places.fromJson(Map<String, dynamic> json){
    id = json['id'];
    placeName = json['place_name'];
    type = json['type'];
    ageCategory = json['age_category'];
    Description = json['Description'];
    city = json['city'];
    priceClass = json['price_class'];
    location = json['location'];
    image = json['image'];
    isActive = json['is_active'];
    rate = json['rate'];
    inFavourite = json['in_favourite'];
  }

}
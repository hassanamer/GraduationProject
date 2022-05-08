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

class HeoModel {
  bool? status;
  String? message;
  Data? data;

  HeoModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

}

class Data {
  List<PopularPlaces>? popularPlaces;
  List<TopRated>? topRated;
  List<dynamic>? offers;
  List<Events>? events;

  Data.fromJson(Map<String, dynamic> json){
    popularPlaces = List.from(json['popular_places']).map((e)=>PopularPlaces.fromJson(e)).toList();
    topRated = List.from(json['Top_Rated']).map((e)=>TopRated.fromJson(e)).toList();
    offers = List.castFrom<dynamic, dynamic>(json['offers']);
    events = List.from(json['events']).map((e)=>Events.fromJson(e)).toList();
  }

}

class PopularPlaces {
  dynamic id;
  String? placeName;
  String? Description;
  String? location;
  String? image;
  bool? isActive;
  dynamic rate;
  bool? inFavourite;

  PopularPlaces.fromJson(Map<String, dynamic> json){
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

class TopRated {
  dynamic id;
  String? placeName;
  String? Description;
  String? location;
  String? image;
  bool? isActive;
  dynamic rate;
  bool? inFavourite;

  TopRated.fromJson(Map<String, dynamic> json){
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

class Events {
  String? eventName;
  String? eventImage;
  String? dateFrom;
  String? dateTo;
  Place? place;
  String? discription;

  Events.fromJson(Map<String, dynamic> json){
    eventName = json['event_name'];
    eventImage = json['event_image'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    place = Place.fromJson(json['place']);
    discription = json['discription'];
  }
}

class Place {
  dynamic id;
  String? placeName;
  String? Description;
  String? location;
  String? priceClass;
  String? image;
  bool? isActive;
  int? type;
  List<dynamic>? favouritePlace;

  Place.fromJson(Map<String, dynamic> json){
    id = json['id'];
    placeName = json['place_name'];
    Description = json['Description'];
    location = json['location'];
    priceClass = json['price_class'];
    image = json['image'];
    isActive = json['is_active'];
    type = json['type'];
    favouritePlace = List.castFrom<dynamic, dynamic>(json['favourite_place']);
  }
}
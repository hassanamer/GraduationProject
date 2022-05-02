
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
  List<Offers>? offers;
  List<Events>? events;

  Data.fromJson(Map<String, dynamic> json){
    popularPlaces = List.from(json['popular_places']).map((e)=>PopularPlaces.fromJson(e)).toList();
    offers = List.from(json['offers']).map((e)=>Offers.fromJson(e)).toList();
    events = List.from(json['events']).map((e)=>Events.fromJson(e)).toList();
  }

}

class PopularPlaces {

  String? placeName;
  String? Description;
  String? location;
  dynamic price;
  String? comment;
  String? image;
  bool? isActive;
  dynamic rate;

  PopularPlaces.fromJson(Map<String, dynamic> json){
    placeName = json['place_name'];
    Description = json['Description'];
    location = json['location'];
    price = json['price'];
    comment = json['comment'];
    image = json['image'];
    isActive = json['is_active'];
    rate = json['rate'];
  }

}

class TopRated {

  String? placeName;
  String? Description;
  String? location;
  int? price;
  String? comment;
  String? image;
  bool? isActive;
  int? rate;

  TopRated.fromJson(Map<String, dynamic> json){
    placeName = json['place_name'];
    Description = json['Description'];
    location = json['location'];
    price = json['price'];
    comment = json['comment'];
    image = json['image'];
    isActive = json['is_active'];
    rate = json['rate'];
  }
}

class Offers {
  int? id;
  int? newPrice;
  Place? place;

  Offers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    newPrice = json['new_price'];
    place = Place.fromJson(json['place']);
  }
}

class Place {

  int? id;
  String? placeName;
  String? Description;
  String? location;
  int? price;
  String? comment;
  String? image;
  bool? isActive;
  int? type;

  Place.fromJson(Map<String, dynamic> json){
    id = json['id'];
    placeName = json['place_name'];
    Description = json['Description'];
    location = json['location'];
    price = json['price'];
    comment = json['comment'];
    image = json['image'];
    isActive = json['is_active'];
    type = json['type'];
  }
}

class Events {
  String? dateFrom;
  String? dateTo;
  String? discription;
  Place? place;

  Events.fromJson(Map<String, dynamic> json){
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    discription = json['discription'];
    place = Place.fromJson(json['place']);
  }
}
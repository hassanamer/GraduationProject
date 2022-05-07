class HomeModel {
  late final bool status;
  late final String message;
  late final Data data;

  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<PopularPlaces> popularPlaces;
  late final List<TopRated> topRated;
  late final List<Offers> offers;
  late final List<Events> events;
  late final List<Places> places;

  Data.fromJson(Map<String, dynamic> json){
    popularPlaces = List.from(json['popular_places']).map((e)=>PopularPlaces.fromJson(e)).toList();
    topRated = List.from(json['Top_Rated']).map((e)=>TopRated.fromJson(e)).toList();
    offers = List.from(json['offers']).map((e)=>Offers.fromJson(e)).toList();
    events = List.from(json['events']).map((e)=>Events.fromJson(e)).toList();
    places = List.from(json['places']).map((e)=>Places.fromJson(e)).toList();
  }

}

class PopularPlaces {
  late final dynamic id;
  late final String placeName;
  late final String Description;
  late final String location;
  late final String image;
  late final bool isActive;
  late final dynamic rate;
  late final bool inFavourite;

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
  late final dynamic id;
  late final String placeName;
  late final String Description;
  late final String location;
  late final String image;
  late final bool isActive;
  late final dynamic rate;
  late final bool inFavourite;

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

class Offers {
  late final dynamic id;
  late final String offerName;
  late final int oldPrice;
  late final int newPrice;
  late final Place place;

  Offers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    offerName = json['offer_name'];
    oldPrice = json['old_price'];
    newPrice = json['new_price'];
    place = Place.fromJson(json['place']);
  }
}

class Place {
  late final dynamic id;
  late final String placeName;
  late final String Description;
  late final String location;
  late final String priceClass;
  late final String image;
  late final bool isActive;
  late final int type;
  late final List<dynamic> favouritePlace;

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

class Events {
  late final String eventName;
  late final String eventImage;
  late final String dateFrom;
  late final String dateTo;
  late final Place place;
  late final String discription;

  Events.fromJson(Map<String, dynamic> json){
    eventName = json['event_name'];
    eventImage = json['event_image'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    place = Place.fromJson(json['place']);
    discription = json['discription'];
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
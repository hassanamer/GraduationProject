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
  late final List<HomePlaces> home_places;

  Data.fromJson(Map<String, dynamic> json){
    popularPlaces = List.from(json['popular_places']).map((e)=>PopularPlaces.fromJson(e)).toList();
    topRated = List.from(json['Top_Rated']).map((e)=>TopRated.fromJson(e)).toList();
    offers = List.from(json['offers']).map((e)=>Offers.fromJson(e)).toList();
    events = List.from(json['events']).map((e)=>Events.fromJson(e)).toList();
    home_places = List.from(json['places']).map((e)=>HomePlaces.fromJson(e)).toList();
  }
}

class PopularPlaces {
  late final dynamic id;
  late final String placeName;
  late final dynamic type;
  late final String ageCategory;
  late final String Description;
  late final dynamic city;
  late final String priceClass;
  late final String location;
  late final String image;
  late final bool isActive;
  late final dynamic rate;
  late final bool inFavourite;

  PopularPlaces.fromJson(Map<String, dynamic> json){
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

class TopRated {
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

  TopRated.fromJson(Map<String, dynamic> json){
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

class Offers {
  late final dynamic id;
  late final String offerName;
  late final String offerDescription;
  late final String offerImage;
  late final dynamic oldPrice;
  late final dynamic newPrice;
  late final Place place;

  Offers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    offerName = json['offer_name'];
    offerDescription = json['offer_description'];
    offerImage = json['offer_image'];
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
  late final String ageCategory;
  late final String image;
  late final bool isActive;
  late final dynamic type;
  late final dynamic city;
  late final List<int> favouritePlace;

  Place.fromJson(Map<String, dynamic> json){
    id = json['id'];
    placeName = json['place_name'];
    Description = json['Description'];
    location = json['location'];
    priceClass = json['price_class'];
    ageCategory = json['age_category'];
    image = json['image'];
    isActive = json['is_active'];
    type = json['type'];
    city = json['city'];
    favouritePlace = List.castFrom<dynamic, int>(json['favourite_place']);
  }
}

class Events {
  late final String eventName;
  late final String eventImage;
  late final String dateFrom;
  late final String dateTo;
  late final String city;
  late final String description;

  Events.fromJson(Map<String, dynamic> json){
    eventName = json['event_name'];
    eventImage = json['event_image'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    city = json['city'];
    description = json['description'];
  }
}

class HomePlaces {
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
  late final List<Comments> comments;

  HomePlaces.fromJson(Map<String, dynamic> json){
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
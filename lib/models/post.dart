 class Post {
  String? category;
  String? placename;
  dynamic rate;
  String? description;
  String? location;
  dynamic price;
  String? comment;
  String? img;
  dynamic date;
  dynamic eventName;
  dynamic offerName;
  dynamic price1;
  dynamic price2;

  Post(
      {this.category,
        this.placename,
        this.rate,
        this.description,
        this.location,
        this.price,
        this.comment,
        this.img,
        this.date,
        this.eventName,
        this.offerName,
        this.price1,
        this.price2});

  Post.fromJson(Map<String, dynamic> json) {
    category = json['cat'];
    placename = json['placename'];
    rate = json['rate'];
    description = json['Description'];
    location = json['location'];
    price = json['price'];
    comment = json['comment'];
    img = json['img'];
    date = json['Date'];
    eventName = json['EventName'];
    offerName = json['OfferName'];
    price1 = json['Price1'];
    price2 = json['Price2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cat'] = category;
    data['placename'] = placename;
    data['rate'] = rate;
    data['Description'] = description;
    data['location'] = location;
    data['price'] = price;
    data['comment'] = comment;
    data['img'] = img;
    data['Date'] = date;
    data['EventName'] = eventName;
    data['OfferName'] = offerName;
    data['Price1'] = price1;
    data['Price2'] = price2;
    return data;
  }
}

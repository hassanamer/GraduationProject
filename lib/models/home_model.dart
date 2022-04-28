class stg_model {
  int? cat;
  String? placeName;
  int? rate;
  String? description;
  String? location;
  int? price;
  String? comment;
  String? img;

  stg_model(
      {this.cat,
        this.placeName,
        this.rate,
        this.description,
        this.location,
        this.price,
        this.comment,
        this.img});

  stg_model.fromJson(Map<String, dynamic> json) {
    cat = json['cat'];
    placeName = json['place name'];
    rate = json['rate'];
    description = json['Description'];
    location = json['location'];
    price = json['price'];
    comment = json['comment'];
    img = json['img'];
  }
}

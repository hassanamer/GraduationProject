class StgModel {
  dynamic cat;
  dynamic placeName;
  dynamic rate;
  dynamic description;
  dynamic location;
  dynamic price;
  dynamic comment;
  dynamic img;

  StgModel(
      {this.cat,
        this.placeName,
        this.rate,
        this.description,
        this.location,
        this.price,
        this.comment,
        this.img});

  StgModel.fromJson(Map<String, dynamic> json) {
    cat = json['cat'];
    placeName = json['placename'];
    rate = json['rate'];
    description = json['Description'];
    location = json['location'];
    price = json['price'];
    comment = json['comment'];
    img = json['img'];
  }
}

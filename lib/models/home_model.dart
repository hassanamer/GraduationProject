class StgModel {
  int? cat;
  String? placeName;
  int? rate;
  String? description;
  String? location;
  int? price;
  String? comment;
  String? img;

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
    placeName = json['place name'];
    rate = json['rate'];
    description = json['Description'];
    location = json['location'];
    price = json['price'];
    comment = json['comment'];
    img = json['img'];
  }
}

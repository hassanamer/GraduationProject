class GetInterestsModel {
  late final bool status;
  late final String messege;
  late final Data data;

  GetInterestsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    messege = json['messege'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final List<Category> category;

  Data.fromJson(Map<String, dynamic> json){
    category = List.from(json['category']).map((e)=>Category.fromJson(e)).toList();
  }
}

class Category {
  late final dynamic id;
  late final String name;
  late final String catImage;

  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    catImage = json['cat_image'];
  }
}
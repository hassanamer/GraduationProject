class UserDataModel {
  UserDataModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.gender,
    required this.password,
    required this.phonenumber,
    required this.dateofbirth,
    required this.img,
    required this.country,
  });

  late final String firstname;
  late final String lastname;
  late final String gender;
  late final String email;
  late final String password;
  late final String phonenumber;
  late final String dateofbirth;
  late final String country;
  late final dynamic img;


  UserDataModel.fromJson(Map<String, dynamic> json) {
    firstname = json['FirstName'] ?? '';
    lastname = json['LastName'] ?? '';
    email = json['Email Address'] ?? '';
    gender = json['Gender'] ?? '';
    password = json['Password'] ?? '';
    dateofbirth = json['Date Of Birth'] ?? '';
    country = json['Country'] ?? '';
    phonenumber = json['Phone Number'] ?? '';
    img = json['img'] ?? '';

  }

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstname,
      'LastName': lastname,
      'Email Address': email,
      'Gender': gender,
      'Password': password,
      'Date Of Birth': dateofbirth,
      'Country': country,
      'Phone Number': phonenumber,
      'img': img,
    };
  }
}
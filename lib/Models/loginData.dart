class LoginModel {
  final int id;
  final String? email;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? accessToken;
  final String? refreshToken;

  LoginModel({
    required this.id,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.accessToken,
    this.refreshToken,
  });

  String displayFullName(){
    if(firstName == null) return "";
    if(lastName == null) return "";
    return firstName!+lastName!;
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json["id"],
      email: json["email"],
      username: json["username"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      gender: json["gender"],
      image: json["image"],
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }

  // GET method
  int getId() {
    return id;
  }

  String? getEmail() {
    return email;
  }

  String? getUsername() {
    return username;
  }
}


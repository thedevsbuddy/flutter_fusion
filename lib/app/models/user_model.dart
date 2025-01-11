class UserModel {
  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.password,
    this.phone,
    this.avatar,
    this.gender,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? phone;
  String? avatar;
  String? gender;

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    String? password,
    String? phone,
    String? avatar,
    String? gender,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        avatar: avatar ?? this.avatar,
        gender: gender ?? this.gender,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        phone: json["phone"] == null ? null : json["phone"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        gender: json["gender"] == null ? null : json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "phone": phone == null ? null : phone,
        "avatar": avatar == null ? null : avatar,
        "gender": gender == null ? null : gender,
      };
}

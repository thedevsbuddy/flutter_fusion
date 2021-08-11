import 'dart:convert';

import '../UserModel.dart';
import 'JwtModel.dart';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.user,
    required this.jwt,
  });

  UserModel user;
  JwtModel jwt;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: UserModel.fromJson(json["user"]),
        jwt: JwtModel.fromJson(json["jwt"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "jwt": jwt,
      };
}

import 'dart:convert';

JwtModel jwtModelFromJson(String str) => JwtModel.fromJson(json.decode(str));

String jwtModelToJson(JwtModel data) => json.encode(data.toJson());

class JwtModel {
  JwtModel({
    required this.token,
    required this.expiresIn,
  });

  String token;
  int expiresIn;

  factory JwtModel.fromJson(Map<String, dynamic> json) => JwtModel(
        token: json['token'],
        expiresIn: json['expires_in'],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expires_in": expiresIn,
      };
}

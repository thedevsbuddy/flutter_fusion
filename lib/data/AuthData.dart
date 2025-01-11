import 'package:faker/faker.dart';

import '../app/models/api_response.dart';
import '../app/models/user_model.dart';

class AuthData {
  static Faker _faker = new Faker();

  /// Create a user model to use in whole file.
  static UserModel _userObject = UserModel(
    id: 1,
    name: "Shoaib khan",
    email: "shoabkhan33@gmail.com",
    phone: "9589988584",
    avatar: "https://random.imagecdn.app/500/500",
    gender: "male",
  );

  /// Login Responses
  static ApiResponse get loginError => ApiResponse(
        status: "error",
        message: "Credentials do not match in our records.",
        data: null,
      );

  static ApiResponse get loginSuccess => ApiResponse(
        status: "success",
        message: "Logged in successfully.",
        data: {"user": _userObject.toJson(), "token": _faker.jwt.secret},
      );

  /// Register responses
  static ApiResponse get registerSuccess => ApiResponse(
        status: "success",
        message: "Welcome aboard! You are now registered with us.",
      );

  /// Get The User Data
  static ApiResponse get getUserSuccess => ApiResponse(
        status: "success",
        message: "Got the user.",
        data: _userObject.toJson(),
      );

  /// Logout response
  static ApiResponse get logoutSuccess =>
      ApiResponse(status: "success", message: "You are logged out");
}

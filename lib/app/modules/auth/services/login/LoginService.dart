import 'package:flutter_mvc/app/models/ApiResponse.dart';
import 'package:get/get.dart';

export 'AppLoginService.dart';
export 'MockLoginService.dart';

abstract class LoginService {
  /// Configure if Mock is enabled or not
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [LoginService]
  static LoginService get instance {
    return Get.find<LoginService>();
  }

  /// Login the user
  Future<ApiResponse> login({required String identifier, required String password});

  /// Registers the user
  Future<ApiResponse> googleLogin();
}

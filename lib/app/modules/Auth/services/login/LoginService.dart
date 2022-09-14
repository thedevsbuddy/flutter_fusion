import 'package:get/get.dart';

import '../../../../models/ApiResponse.dart';
import 'AppLoginService.dart';
import 'MockLoginService.dart';

abstract class LoginService {
  /// Configure if Mock is enabled or not
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [LoginService]
  static LoginService get instance {
    if (!Get.isRegistered<LoginService>())
      Get.lazyPut<LoginService>(
          () => MOCK_ENABLED ? MockLoginService() : AppLoginService());
    return Get.find<LoginService>();
  }

  /// Login the user
  Future<ApiResponse> submit({required Map<String, dynamic> body});

  /// Login user with Google
  Future<ApiResponse> google();

  /// Login user with Github
  Future<ApiResponse> github();

  /// Login user with Facebook
  Future<ApiResponse> facebook();
}

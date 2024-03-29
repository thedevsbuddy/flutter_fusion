import 'package:get/get.dart';

import '../../../models/ApiResponse.dart';
import 'AppAuthService.dart';
import 'MockAuthService.dart';

abstract class AuthService {
  /// Configure if Mock is enabled or not
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [AuthService]
  static AuthService get instance {
    if (!Get.isRegistered<AuthService>()) Get.lazyPut<AuthService>(() => MOCK_ENABLED ? MockAuthService() : AppAuthService());
    return Get.find<AuthService>();
  }

  /// Start the server request
  void init(String client);

  /// Stop the server request
  void close(String client);

  /// Login the user
  Future<ApiResponse> login({required String client, required Map<String, dynamic> body});

  /// Registers user
  Future<ApiResponse> register({required String client, required Map<String, dynamic> body});

  /// Verifies OTP
  Future<ApiResponse> verifyOtp({required String client, required Map<String, dynamic> body});

  /// Login user with Google
  Future<ApiResponse> google({required String client});

  /// Login user with Github
  Future<ApiResponse> github({required String client});

  /// Login user with Facebook
  Future<ApiResponse> facebook({required String client});
}

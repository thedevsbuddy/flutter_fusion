import 'package:flutter_fusion/app/models/ApiResponse.dart';
import 'package:get/get.dart';

import 'AppAuthStateService.dart';
import 'MockAuthStateService.dart';

abstract class AuthStateService {
  /// Configure if Mock is enabled or not
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [AuthStateService]
  static AuthStateService get instance {
    if (!Get.isRegistered<AuthStateService>()) Get.lazyPut<AuthStateService>(() => MOCK_ENABLED ? MockAuthStateService() : AppAuthStateService());
    return Get.find<AuthStateService>();
  }

  /// Start the server request
  void init(String client);

  /// Stop the server request
  void close(String client);

  /// Get and refresh user data
  Future<ApiResponse> getUser();

  /// Logout the user from system
  Future<ApiResponse> logout();
}

import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../services.dart';

abstract class AuthStateService extends BaseService {
  /// Configure if Mock is enabled or not
  static const mockEnabled = true;

  /// Create and get the instance of [AuthStateService]
  static AuthStateService get instance {
    if (!Get.isRegistered<AuthStateService>())
      Get.lazyPut<AuthStateService>(
          () => mockEnabled ? LocalAuthStateService() : ApiAuthStateService());
    return Get.find<AuthStateService>();
  }

  /// Get and refresh user data
  Future<ApiResponse> getUser();

  /// Logout the user from system
  Future<ApiResponse> logout();
}

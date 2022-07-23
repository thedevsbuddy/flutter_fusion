import 'package:flutter_mvc/app/models/ApiResponse.dart';
import 'package:get/get.dart';

export 'AppSettingsService.dart';
export 'MockSettingsService.dart';

abstract class SettingsService {
  /// Configure if Mock is enabled or not
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [LoginService]
  static SettingsService get instance {
    return Get.find<SettingsService>();
  }

  /// Login the user
  Future<ApiResponse> login({required String identifier, required String password});

  /// Registers the user
  Future<ApiResponse> googleLogin();
}

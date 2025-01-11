import 'package:get/get.dart';

import '../../../models/api_response.dart';
import 'api_settings_service.dart';
import 'local_settings_service.dart';

abstract class SettingsService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const mockEnabled = true;

  /// Create and get the instance of [SettingsService]
  static SettingsService get instance {
    if (!Get.isRegistered<SettingsService>())
      Get.lazyPut<SettingsService>(
          () => mockEnabled ? LocalSettingsService() : ApiSettingsService());
    return Get.find<SettingsService>();
  }

  /// Do Something
  Future<ApiResponse> doSomething();
}

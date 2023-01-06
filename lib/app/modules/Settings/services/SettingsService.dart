import 'package:get/get.dart';

import '../../../models/ApiResponse.dart';
import 'AppSettingsService.dart';
import 'MockSettingsService.dart';

abstract class SettingsService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [SettingsService]
  static SettingsService get instance {
    if (!Get.isRegistered<SettingsService>()) Get.lazyPut<SettingsService>(() => MOCK_ENABLED ? MockSettingsService() : AppSettingsService());
    return Get.find<SettingsService>();
  }

  /// Do Something
  Future<ApiResponse> doSomething();
}

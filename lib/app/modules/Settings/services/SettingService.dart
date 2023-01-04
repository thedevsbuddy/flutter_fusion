import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'AppSettingService.dart';
import 'MockSettingService.dart';

abstract class SettingService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [SettingService]
  static SettingService get instance {
    if (!Get.isRegistered<SettingService>()) Get.lazyPut<SettingService>(() => MOCK_ENABLED ? MockSettingService() : AppSettingService());
    return Get.find<SettingService>();
  }

  /// Do Something
  Future<ApiResponse> doSomething();
}


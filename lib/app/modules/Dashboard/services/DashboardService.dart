import '../../../models/ApiResponse.dart';
import 'package:get/get.dart';

import 'AppDashboardService.dart';
import 'MockDashboardService.dart';

abstract class DashboardService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [DashboardService]
  static DashboardService get instance {
    if (!Get.isRegistered<DashboardService>()) Get.lazyPut<DashboardService>(() => MOCK_ENABLED ? MockDashboardService() : AppDashboardService());
    return Get.find<DashboardService>();
  }

  /// Do Something
  Future<ApiResponse> doSomething();
}


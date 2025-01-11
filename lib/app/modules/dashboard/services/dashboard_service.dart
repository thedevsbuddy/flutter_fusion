import 'package:get/get.dart';

import '../../../models/api_response.dart';
import '../../../shared/services/services.dart';
import 'api_dashboard_service.dart';
import 'local_dashboard_service.dart';

abstract class DashboardService extends BaseService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const mockEnabled = true;

  /// Create and get the instance of [DashboardService]
  static DashboardService get instance {
    if (!Get.isRegistered<DashboardService>())
      Get.lazyPut<DashboardService>(
          () => mockEnabled ? LocalDashboardService() : ApiDashboardService());
    return Get.find<DashboardService>();
  }

  /// Do Something
  Future<ApiResponse> doSomething({required String client});
}

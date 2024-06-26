import 'package:flutter_fusion/app/modules/Modules.dart';
import 'package:get/get.dart';

import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/Errors.dart';

class DashboardController extends AppController {
  static DashboardController get instance {
    if (!Get.isRegistered<DashboardController>()) Get.put(DashboardController());
    return Get.find<DashboardController>();
  }

  DashboardService _dashboardService = DashboardService.instance;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getData() async {
    try {
      String _client = 'dashboard-get-data';
      _dashboardService.init(_client);
      await _dashboardService.doSomething(client: _client);
    } on Exception catch (e) {
      Get.to(() => ErrorPage(message: "$e"));
    } on Error catch (e) {
      Get.to(() => ErrorPage(message: "$e"));
    }
  }
}

import 'package:get/get.dart';

import '../../../shared/controllers/AppController.dart';

class SettingsController extends AppController {
  static SettingsController get instance {
    if (!Get.isRegistered<SettingsController>()) Get.put(SettingsController());
    return Get.find<SettingsController>();
  }

  /// Observables

  /// Getters

  @override
  void onInit() {
    super.onInit();
  }

}

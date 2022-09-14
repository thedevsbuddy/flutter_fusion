import 'package:get/get.dart';

import 'AppController.dart';

class ExampleController extends AppController {
  static ExampleController get instance {
    if (!Get.isRegistered<ExampleController>()) Get.put(ExampleController());
    return Get.find<ExampleController>();
  }

  /// Observables
  var _responsiveVar = "".obs;

  /// Getters
  String get responsiveVar => _responsiveVar.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReconnect() {
    /// TODO: Implement what will happen
    /// if the user will reconnect to any network. [Cellular Data | WiFi]
  }
}

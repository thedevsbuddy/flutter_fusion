import 'package:get/get.dart';

import 'AppController.dart';

class ExampleController extends AppController {
  static ExampleController get instance => Get.find();

  /// Observables

  /// Getters

  @override
  void onReconnect() {
    /// TODO: Implement what will happen
    /// if the user will reconnect to any network. [Cellular Data | WiFi]
  }

  @override
  void onInit() {
    super.onInit();
  }
}

import 'package:flutter_mvc/app/controllers/AppController.dart';
import 'package:get/get.dart';

class ExampleController extends AppController {
  static ExampleController get to => Get.find();

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

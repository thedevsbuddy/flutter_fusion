import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../controllers/AuthState.dart';
import '../services/Services.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    /// [AuthService] instance
    Get.lazyPut<AuthService>(() => AuthService.MOCK_ENABLED ? MockAuthService() : AppAuthService());

    /// Initialize Auth controller
    Get.lazyPut<AuthState>(() => AuthState(), fenix: true);

    /// [ButtonController] instance
    Get.create(() => ButtonController(), permanent: false);
  }
}

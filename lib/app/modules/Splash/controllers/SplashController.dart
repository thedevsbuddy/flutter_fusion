import 'package:get/get.dart';

import '../../../../config/Config.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/controllers/AuthState.dart';

class SplashController extends AppController {
  static SplashController get instance => Get.find();
  final AuthState auth = AuthState.instance;

  @override
  void onInit() {
    super.onInit();
    redirectUser();
  }

  Future<void> redirectUser() async {
    if (Config.authRequired) {
      if (await auth.check()) {
        await 5.delay(() => Get.offAllNamed('/dashboard'));
      } else {
        await 5.delay(() => Get.offAllNamed('/login'));
      }
    } else {
      await 5.delay(() => Get.offAllNamed('/dashboard'));
    }
  }
}

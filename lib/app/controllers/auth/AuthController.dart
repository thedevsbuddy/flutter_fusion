import 'package:basic_ui/basic_ui.dart';

import '../../../config/Config.dart';
import '../../helpers/Request.dart';
import '../../models/ApiResponse.dart';
import '../AppController.dart';
import 'package:get/get.dart';

import '../../helpers/Global.dart';
import '../../models/UserModel.dart';

class AuthController extends AppController {
  static AuthController get to => Get.find();

  /// Observables
  var _user = UserModel().obs;

  /// Getters
  UserModel get user => this._user.value;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    if (storage.read("token") != null) {
      ApiResponse response = await Request.get('/profile', authenticate: true);

      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }

      if (response.hasData()) {
        await storage.write("user", response.data);
        _user(UserModel.fromJson(response.data));
      }
    }
  }

  Future<void> logout() async {
    ApiResponse response = await Request.post('/logout', authenticate: true);
    if (response.hasError()) {
      Toastr.show(message: "${response.message}");
      return;
    }
    Toastr.show(message: "${response.message}");
    await storage.remove('token');
    await storage.remove('user');
    if (auth.check()) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('${Config.homeUrl}');
    }
  }

  Future<void> setUserData(data) async {
    await storage.write("user", data);
  }

  Future<void> setUserToken(token) async {
    await storage.write("token", token);
  }

  bool check() {
    if (storage.read('token') != null) {
      return true;
    }
    return false;
  }
}

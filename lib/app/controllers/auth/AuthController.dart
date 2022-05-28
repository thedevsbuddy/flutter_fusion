import 'package:ui_x/ui_x.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../helpers/Request.dart';
import '../../helpers/Global.dart';
import '../../models/ApiResponse.dart';
import '../../models/UserModel.dart';
import '../AppController.dart';

/// Manages authentication states and logics
/// for entire application
class AuthController extends AppController {
  /// Static Getter for [AuthController]
  ///
  /// Can be accessed by calling `AuthController.to`
  static AuthController get to => Get.find<AuthController>();

  /// Observables
  var _user = UserModel().obs;

  /// Getters
  UserModel get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  /// Refreshes User data on every launch of the application
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

  /// Logout the user
  Future<void> logout() async {
    ApiResponse response = await Request.post('/logout', authenticate: true);
    if (response.hasError()) {
      Toastr.show(message: "${response.message}");
      return;
    }
    Toastr.show(message: "${response.message}");
    await storage.remove('token');
    await storage.remove('user');
    if (check()) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('${Config.homeUrl}');
    }
  }

  /// Setter for user data [setUserData(String)]
  Future<void> setUserData(String data) async {
    await storage.write("user", data);
  }

  /// Setter for user auth token [setUserToken(String)]
  Future<void> setUserToken(String token) async {
    await storage.write("token", token);
  }

  /// Checks if user is logged in by validating the token
  check() async {
    if (storage.read('token') != null) {
      ApiResponse response =
          await Request.get("/validate-token", authenticate: true);
      if (response.hasError()) {
        return false;
      }
      return true;
    }
    return false;
  }
}

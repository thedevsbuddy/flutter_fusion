import 'package:get/get.dart';

import '../../helpers/Global.dart';
import '../../models/UserModel.dart';
import 'AppController.dart';

/// Manages authentication states and logics
/// for entire application
class AuthState extends AppController {
  /// Static Getter for [AuthState]
  ///
  /// Can be accessed by calling `AuthState.instance`
  static AuthState get instance => Get.find<AuthState>();

  /// Observables
  var _user = UserModel().obs;

  /// Getters  UserModel get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  /// Refreshes User data on every launch of the application
  Future<void> getUser() async {
    if (storage.read("token") != null) {
    //   ApiResponse response = await Request.get('/profile', authenticate: true);
    //
    //   if (response.hasError()) {
    //     Toastr.show(message: "${response.message}");
    //     return;
    //   }
    //
    //   if (response.hasData()) {
    //     await storage.write("user", response.data);
    //     _user(UserModel.fromJson(response.data));
    //   }
    }
  }

  /// Logout the user
  Future<void> logout() async {
    // ApiResponse response = await Request.post('/logout', authenticate: true);
    // if (response.hasError()) {
    //   Toastr.show(message: "${response.message}");
    //   return;
    // }
    // Toastr.show(message: "${response.message}");
    await storage.remove('token');
    await storage.remove('user');
    Get.offAllNamed('/login');
  }

  /// Setter for user data [setUserData(String)]
  Future<void> setUserData(Map<String, dynamic> userData) async {
    await storage.write("user", userData);
    _user(UserModel.fromJson(userData));
  }

  /// Setter for user auth token [setUserToken(String)]
  Future<void> setUserToken(String token) async {
    await storage.write("token", token);
  }

  /// Checks if user is logged in by validating the token
  Future<bool> check() async {
    if (storage.read('token') != null) {
      // ApiResponse response = await Request.get("/validate-token", authenticate: true);
      // if (response.hasError()) {
      //   return false;
      // }
      return true;
    }

    return false;
  }

  // bool get loggedIn => check().whenComplete(() => true);
}

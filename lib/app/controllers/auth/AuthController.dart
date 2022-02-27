import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/controllers/AppController.dart';
import 'package:flutter_mvc/app/models/ApiResponse.dart';
import 'package:get/get.dart';

import '../../helpers/Global.dart';
import '../../helpers/request.dart';
import '../../models/UserModel.dart';

class AuthController extends AppController {
  static AuthController get to => Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Observables
  var _user = UserModel().obs;

  final TextEditingController usernameInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  /// Getters
  UserModel get user => this._user.value;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void login() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      ShowSnack.error(message: "Please fill all the required fields!");
      return;
    }

    Map<String, dynamic> body = {
      "username": usernameInput.text,
      "password": passwordInput.text,
    };

    setBusy(true);
    ApiResponse response = await Request.post('/auth', body: body);

    if (response.hasError()) {
      ShowSnack.error(message: "${response.message}");
      setBusy(false);
      return;
    }
    ShowSnack.success(message: "${response.message}");
    await storage.write("token", response.data['token']);
    await storage.write("user", response.data['user']);
    _user(UserModel.fromJson(response.data['user']));
    setBusy(false);
    Get.offAllNamed("/dashboard");
  }

  Future<void> getUser() async {
    if (storage.read("token") != null) {
      ApiResponse response = await Request.get('/profile', authenticate: true);
      if (response.hasError()) {
        ShowSnack.error(message: "${response.message}");
        setBusy(false);
        return;
      }
      await storage.write("user", response.data);
      _user(UserModel.fromJson(response.data));
    }
  }

  Future<void> logout() async {
    ApiResponse response = await Request.post('/logout', authenticate: true);
    if (response.hasError()) {
      ShowSnack.error(message: "${response.message}");
      setBusy(false);
      return;
    }
    ShowSnack.success(message: "${response.message}");
    await storage.remove('token');
    await storage.remove('user');
    Get.offAllNamed('/login');
  }

  bool check() {
    if (storage.read('token') != null) {
      return true;
    }
    return false;
  }
}

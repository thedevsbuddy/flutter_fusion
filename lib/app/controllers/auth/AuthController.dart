import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../helpers/Global.dart';
import '../../helpers/request.dart';
import '../../models/UserModel.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var _user = UserModel().obs;

  var _isBusy = false.obs;

  final TextEditingController usernameInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  // Getters
  bool get isBusy => this._isBusy.value;
  UserModel get user => this._user.value;

  @override
  void onInit() {
    super.onInit();
  }

  void login() async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    Map<String, dynamic> body = {
      "username": usernameInput.text,
      "password": passwordInput.text,
    };

    // var response =
    //     await Request.post(Uri.parse('${Config.apiBaseUrl}/auth'), body: body);

    // if (response == null) return;
  }

  Future<void> getUser() async {
    var response = await Request.get(Uri.parse('${Config.apiBaseUrl}/profile'));
  }

  void logout() async {
    await storage.remove('auth_token');
    await storage.remove('user');

    Get.offAllNamed('/login');
  }

  bool check() {
    var _token = storage.read('token');
    if (_token != null) {
      return true;
    }
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/modules/auth/services/login/LoginService.dart';
import 'package:flutter_mvc/app/views/errors/ServerErrorPage.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../../config/Config.dart';
import '../../../controllers/AppController.dart';
import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';

class LoginController extends AppController {
  static LoginController get instance => Get.find();

  final LoginService _loginService = Get.put<LoginService>(LoginService.MOCK_ENABLED ? MockLoginService() : AppLoginService());

  /// Variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController identifierInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      // Toastr.show(message: "Please fill all the required fields!");
      return;
    }
    try {
      ApiResponse response = await _loginService.login(identifier: identifierInput.text, password: passwordInput.text);
      log.w(response.data['user']);
      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }
      // await auth.setUserData(jsonEncode(response.data['user']));
      await auth.setUserToken(response.data['token']);
      Toastr.show(message: "${response.message}");

      Get.offAllNamed("${Config.homeUrl}");
    } catch (e) {
      Get.to(() => ServerErrorPage(message: "$e"));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../../config/Config.dart';
import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../../Modules.dart';

class LoginController extends AppController {
  static LoginController get instance => Get.find();

  final LoginService _loginService = LoginService.instance;

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

      /// Prepare form data to be sent to server
      Map<String, dynamic> body = {
        "email": identifierInput.text,
        "password": passwordInput.text,
      };

      /// Call api to login user
      ApiResponse response = await _loginService.submit(body: body);
      // log.w(response.data);
      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }
      await auth.setUserData(response.data['user']);
      await auth.setUserToken(response.data['token']);
      Toastr.show(message: "${response.message}");

      Get.offAllNamed("${Config.homeUrl}");
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "$e"));
    }
  }
}

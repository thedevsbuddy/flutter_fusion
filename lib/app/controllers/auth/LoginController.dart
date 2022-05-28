import 'package:ui_x/ui_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/views/errors/ServerErrorPage.dart';
import '../../../config/Config.dart';
import '../../helpers/Request.dart';
import '../../models/ApiResponse.dart';
import '../AppController.dart';
import 'package:get/get.dart';

import '../../helpers/Global.dart';

class LoginController extends AppController {
  static LoginController get to => Get.find();

  /// Variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController identifierInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  void login(ButtonController btn) async {
    final isValid = formKey.currentState!.validate();

    if (!isValid) {
      Toastr.show(message: "Please fill all the required fields!");
      return;
    }

    Map<String, dynamic> body = {
      "identifier": identifierInput.text,
      "password": passwordInput.text,
    };

    btn.setBusy(true).setDisabled(true);
    try {
      ApiResponse response = await Request.post('/auth/login', body: body);

      if (response.hasError()) {
        Toastr.show(message: "${response.message}");

        btn.setBusy(false).setDisabled(false);
        return;
      }
      await auth.setUserData(response.data['user']);
      await auth.setUserToken(response.data['token']);
      Toastr.show(message: "${response.message}");

      btn.setBusy(false).setDisabled(false);
      Get.offAllNamed("${Config.homeUrl}");
    } catch (e) {
      btn.setBusy(false).setDisabled(false);
      Get.to(ServerErrorPage(message: "$e"));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../../routes/Routes.dart';
import '../../../helpers/Global.dart';
import '../../../models/ApiResponse.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../../Modules.dart';

class LoginController extends AppController {
  static LoginController get instance {
    if (!Get.isRegistered<LoginController>()) Get.put(LoginController());
    return Get.find<LoginController>();
  }

  final AuthService _authService = AuthService.instance;

  /// Variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController identifierInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) {
      // Toastr.show(message: "Please fill all the required fields!");
      return;
    }

    try {
      /// Prepare form data to be sent to server
      Map<String, dynamic> body = {
        "identifier": identifierInput.text,
        "password": passwordInput.text,
      };

      /// Initialize the Service and request server
      /// With unique client id
      _authService.init('login');

      /// Call api to login user
      ApiResponse response = await _authService.login(body: body);
      // log.w(response.data);
      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }
      await auth.setUserData(response.data['user']);
      await auth.setUserToken(response.data['token']);
      Toastr.show(message: "${response.message}");

      /// Close the Service and request server
      /// With unique client id
      _authService.close('login');

      /// Redirect user
      Get.offAllNamed(Routes.dashboard);
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
    }
  }
}

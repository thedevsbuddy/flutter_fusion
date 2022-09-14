import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../models/ApiResponse.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ServerErrorPage.dart';
import '../../Modules.dart';

class RegisterController extends AppController {
  static RegisterController get instance {
    if (!Get.isRegistered<RegisterController>()) Get.put(RegisterController());
    return Get.find<RegisterController>();
  }

  final LoginController loginController = LoginController.instance;
  final RegisterService _registerService = RegisterService.instance;

  /// Observable
  var _selectedState = 0.obs;

  /// Getters
  int get selectedState => _selectedState.value;

  /// Variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameInput = TextEditingController();
  final TextEditingController lastNameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController phoneInput = TextEditingController();
  final TextEditingController referralInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  final TextEditingController confirmPasswordInput = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    try {
      Map<String, dynamic> body = {
        "first_name": firstNameInput.text,
        "last_name": lastNameInput.text,
        "email": emailInput.text,
        "password": passwordInput.text,
        "phone": phoneInput.text,
        "state": _selectedState.value,
        "referral_code": "",
      };

      ApiResponse response = await _registerService.submit(body: body);

      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }

      loginController.identifierInput.text = emailInput.text;
      loginController.passwordInput.text = passwordInput.text;

      await loginController.submit();
    } on Exception catch (e) {
      Get.to(() => ServerErrorPage(message: "${e.toString()}"));
    }
  }

  void onStateSelect(int state) {
    _selectedState(state);
  }
}

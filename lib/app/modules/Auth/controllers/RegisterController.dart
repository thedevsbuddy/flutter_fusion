import 'package:flutter/material.dart';
import 'package:flutter_fusion/app/models/UserModel.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../models/ApiResponse.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/errors/ErrorPage.dart';
import '../../Modules.dart';

class RegisterController extends AppController {
  static RegisterController get instance {
    if (!Get.isRegistered<RegisterController>()) Get.put(RegisterController());
    return Get.find<RegisterController>();
  }

  final LoginController loginController = LoginController.instance;
  final AuthService _authService = AuthService.instance;

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
    String _client = "registerSubmit";

    try {
      Map<String, dynamic> body = UserModel(
        name: firstNameInput.text,
        email: emailInput.text,
        password: passwordInput.text,
        phone: phoneInput.text,
      ).toJson();

      /// Initialize the Service and request server
      _authService.init(_client);

      ApiResponse response = await _authService.register(body: body, client: _client);

      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }

      /// Close the Service and request server
      _authService.close(_client);

      loginController.identifierInput.text = emailInput.text;
      loginController.passwordInput.text = passwordInput.text;

      /// Login the user after registration
      await loginController.submit();
    } on Exception catch (e) {
      Get.to(() => ErrorPage(message: "${e.toString()}"));
    }
  }

  void onStateSelect(int state) {
    _selectedState(state);
  }
}

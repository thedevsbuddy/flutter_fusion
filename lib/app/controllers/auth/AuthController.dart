import 'package:flutter/cupertino.dart';
import 'package:flutter_mvc/app/helpers/Snackbar.dart';
import 'package:flutter_mvc/app/models/UserModel.dart';
import 'package:flutter_mvc/config/Config.dart';
import 'package:get/get.dart';

import '../../helpers/Global.dart';
import '../../helpers/request.dart';
import '../Controller.dart';

class AuthController extends GetxController with Controller {
  static AuthController get to => Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var _user = UserModel().obs;

  var _isBusy = false.obs;

  var username = '';
  var password = '';

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

    if (usernameInput.text.isEmpty) {
      ShowSnack.error(message: "Please type username to continue!");
      return;
    }
    if (passwordInput.text.isEmpty) {
      ShowSnack.error(message: "Please type password to continue!");
      return;
    }

    showLoading(message: "Logging you in...");

    Map<String, dynamic> body = {
      "username": usernameInput.text,
      "password": passwordInput.text,
    };

    // var response =
    //     await Request.post(Uri.parse('${Config.apiBaseUrl}/auth'), body: body)
    //         .catchError(handleError);

    Future.delayed(Duration(seconds: 3), () => hideLoading());

    // if (response == null) return;
  }

  bool check() {
    var _token = storage.read('token');
    if (_token != null) {
      return true;
    }
    return false;
  }
}

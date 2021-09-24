import 'package:flutter/cupertino.dart';
import 'package:flutter_mvc/app/models/UserModel.dart';
import 'package:flutter_mvc/config/Config.dart';
import 'package:get/get.dart';

import '../../helpers/Global.dart';
import '../../helpers/request.dart';
import '../Controller.dart';

class AuthController extends GetxController with Controller {
  static AuthController get to => Get.find();

  var _user = UserModel().obs;

  var _isLoading = false.obs;

  final TextEditingController usernameInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  // Getters
  bool get isLoading => this._isLoading.value;
  UserModel get user => this._user.value;

  @override
  void onInit() {
    usernameInput.text = "bob@bob.com.au";
    passwordInput.text = "S3cR3tP4ssW0rd";

    super.onInit();
  }

  void login() async {
    _isLoading(true);

    Map<String, dynamic> body = {
      "username": usernameInput.text,
      "password": passwordInput.text,
    };

    var response = await Request.post(Uri.parse('${Config.apiBaseUrl}/auth'), body: body).catchError(handleError);

    _isLoading(false);

    if (response == null) return;

    // TODO: add success stuffs
  }

  bool check() {
    var _token = storage.read('token');
    if (_token != null) {
      return true;
    }
    return false;
  }
}

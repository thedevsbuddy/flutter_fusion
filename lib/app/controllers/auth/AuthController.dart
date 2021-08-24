import 'package:flutter_mvc/app/helpers/request.dart';
import 'package:get/get.dart';

import '../Controller.dart';

class AuthController extends GetxController with Controller {
  static AuthController get to => Get.find();

  void login() async {
    showLoading();
    var response = await Request.get(Uri.parse('')).catchError(handleError);
    hideLoading();
    if (response == null) return;
  }
}

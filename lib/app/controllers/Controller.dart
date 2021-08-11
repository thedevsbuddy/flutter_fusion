import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../exceptions/app_exception.dart';

class Controller {
  void handleError(error) {
    hideLoading();
    if (error is BadRequestException) {
      var message = error.message;
      Get.toNamed('bad-request-error',
          parameters: {"message": message.toString()});
    } else if (error is FetchDataException) {
      var message = error.message;
      Get.toNamed('server-error', parameters: {"message": message.toString()});
    } else if (error is ApiNotRespondingException) {
      Get.toNamed('server-error',
          parameters: {"message": "Api took too long to respond!"});
    } else {
      Get.toNamed('server-error',
          parameters: {"message": "Something went wrong!"});
    }
  }

  showLoading() {
    DialogHelper.showLoading();
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}

class DialogHelper {
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}

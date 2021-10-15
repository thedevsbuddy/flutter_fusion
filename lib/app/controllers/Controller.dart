import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../exceptions/app_exception.dart';

class Controller {
  void handleError(error) {
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

  void showLoading({String? message}) {
    DialogHelper.showLoading(message);
  }

  void hideLoading() {
    DialogHelper.hideLoading();
  }
}

class DialogHelper {
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: kcDarkest,
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: spacer8, horizontal: spacer5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingIconWidget(height: spacer8),
                SizedBox(height: 8),
                Text(
                  message ?? 'Loading...',
                  style: TextStyle(
                    color: kcWhite,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
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

import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnack {
  // Success
  static void success(
      {required String message,
      Duration duration = const Duration(seconds: 3)}) {
    return Get.snackbar(
      "Success!",
      Str.ucFirst(message),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.grey[900],
      icon: Icon(Icons.info_outline),
      margin: EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  // Error
  static void error(
      {required String message,
      Duration duration = const Duration(seconds: 3)}) {
    return Get.snackbar(
      "Error!",
      Str.ucFirst(message),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: Icon(Icons.error),
      margin: EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  // Info
  static void info(
      {required String message,
      Duration duration = const Duration(seconds: 3)}) {
    return Get.snackbar(
      "Info!",
      Str.ucFirst(message),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blueAccent,
      colorText: Colors.white,
      icon: Icon(Icons.info),
      margin: EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  // Warning
  static void warning(
      {required String message,
      Duration duration = const Duration(seconds: 3)}) {
    return Get.snackbar(
      "Warning!",
      Str.ucFirst(message),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.amber[700],
      colorText: Colors.grey[900],
      icon: Icon(Icons.warning),
      margin: EdgeInsets.only(left: 8.0, bottom: 12.0, right: 8.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }

  // Warning
  static void toast(
      {required String message,
      Duration duration = const Duration(seconds: 3),
      SnackPosition position = SnackPosition.BOTTOM}) {
    return Get.snackbar(
      '',
      Str.ucFirst(message),
      snackPosition: position,
      backgroundColor: Colors.black.withOpacity(0.9),
      colorText: Colors.grey[200],
      margin: EdgeInsets.all(0.0),
      borderRadius: 0.0,
      duration: duration,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyles {
  static TextStyle? get heading1 => Get.textTheme.headline1;
  static TextStyle? get heading2 => Get.textTheme.headline2;
  static TextStyle? get heading3 => Get.textTheme.headline3;
  static TextStyle? get title => Get.textTheme.headline2;
  static TextStyle? get subtitle =>
      Get.textTheme.headline3?.copyWith(fontSize: 25.0);
  static TextStyle? get body => Get.textTheme.bodyText1;
  static TextStyle? get bodySm =>
      Get.textTheme.bodyText1?.copyWith(fontSize: 14.0);
  static TextStyle? get caption => Get.textTheme.caption;
  static TextStyle? get button => Get.textTheme.button;
}

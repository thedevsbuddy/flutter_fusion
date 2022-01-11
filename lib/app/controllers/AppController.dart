import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  ScrollController scrollController = new ScrollController(keepScrollOffset: false);

  RxBool isStickyRx = false.obs;
  bool get isSticky => this.isStickyRx.value;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      onScroll();
    });
  }

  void onScroll() {
    if (scrollController.positions.last.pixels >= 72) {
      isStickyRx(true);
    } else {
      isStickyRx(false);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

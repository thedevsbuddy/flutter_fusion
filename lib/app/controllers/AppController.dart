import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  ScrollController scrollController = new ScrollController(keepScrollOffset: false);

  /// Observables
  RxBool setSticky = false.obs;
  RxBool setBusy = false.obs;
  RxBool _isConnected = false.obs;

  /// Getters
  bool get isSticky => this.setSticky.value;
  bool get isBusy => this.setBusy.value;
  bool get isConnected => this._isConnected.value;
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    super.onInit();
    this.checkConnection();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _isConnected(false);
      } else {
        _isConnected(true);
        onReconnect();
      }
    });
    scrollController.addListener(() {
      onScroll();
    });
  }

  void onScroll() {
    if (scrollController.positions.last.pixels >= 72) {
      setSticky(true);
    } else {
      setSticky(false);
    }
  }

  void onReconnect() {
    // TODO: Implement onReConnect Method
  }

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      _isConnected(false);
    } else {
      _isConnected(true);
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    subscription.cancel();
    super.onClose();
  }
}

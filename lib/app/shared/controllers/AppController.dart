import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  ScrollController scrollController = new ScrollController(keepScrollOffset: false);

  /// Observables
  RxBool setSticky = false.obs;
  bool _isBusy = false;
  bool _isConnected = false;

  /// Getters
  bool get isSticky => this.setSticky.value;

  bool get isBusy => this._isBusy;

  bool get isConnected => this._isConnected;

  /// StreamSubscription for ConnectivityResult
  /// ```dart
  /// StreamSubscription<ConnectivityResult>
  /// ```
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    this.checkConnection();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _isConnected = false;
      } else {
        _isConnected = true;
        onReconnect();
      }
      update();
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

  /// Executes when user re-connect to any network.
  /// ```
  /// [Cellular Data | WiFi]
  /// ```
  void onReconnect() {
    /// TODO: Implement onReconnect Method
  }

  /// Checks User connection state.
  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      _isConnected = false;
    } else {
      _isConnected = true;
    }
    update();
  }

  /// Set the busy state
  void setBusy(bool val) {
    _isBusy = val;
    update();
  }

  @override
  void onClose() {
    scrollController.dispose();
    connectivitySubscription.cancel();
    super.onClose();
  }
}

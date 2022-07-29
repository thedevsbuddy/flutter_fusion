import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CountrDuration.dart';

class Countr extends StatelessWidget {
  const Countr({
    Key? key,
    required this.controller,
    required this.builder,
    this.onTimerComplete,
  }) : super(key: key);

  final Widget Function(BuildContext context, CountrDuration remainingTime) builder;
  final CountrController controller;
  final Function()? onTimerComplete;

  String _strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    controller.__onDoneCallback(onTimerComplete);
    return GetBuilder<CountrController>(
        init: controller,
        builder: (CountrController controller) {
          return builder(
            context,
            CountrDuration(
              days: _strDigits(controller.remainingTime.inDays),
              hours: _strDigits(controller.remainingTime.inHours.remainder(24)),
              minutes: _strDigits(controller.remainingTime.inMinutes.remainder(60)),
              seconds: _strDigits(controller.remainingTime.inSeconds.remainder(60)),
            ),
          );
        }
    );
  }
}



class CountrController extends GetxController {
  CountrController({
    this.endTime = const Duration(seconds: 30),
    this.initializationDelay = const Duration(seconds: 0),
    this.initialize = false,
    this.reducer = 1,
  });

  final Duration endTime;
  final Duration initializationDelay;
  final bool initialize;
  late Timer? countdownTimer;
  late Duration remainingTime = endTime;
  Function()? _callback;
  final int reducer;


  @override
  void onInit() {
    super.onInit();
    if(initialize) Future.delayed(initializationDelay, () => startTimer());
  }


  void startTimer() {
    countdownTimer = Timer.periodic(1.seconds, (_) => _setCountDown());
  }

  void stopTimer() {
    countdownTimer!.cancel();
    update();
  }

  void resetTimer() {
    stopTimer();
    remainingTime = endTime;
    update();
  }

  void __onDoneCallback(Function()? callback){
    if(callback != null) _callback = callback;
  }

  void _setCountDown() {
    final seconds = remainingTime.inSeconds - reducer;
    if (seconds < 0) {
      countdownTimer!.cancel();
      if(_callback != null) _callback!();
    } else {
      remainingTime = Duration(seconds: seconds);
    }
    update();
  }
}

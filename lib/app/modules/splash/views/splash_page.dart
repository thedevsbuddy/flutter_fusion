import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final SplashController controller = SplashController.instance;

  @override
  Widget build(BuildContext context) {
    final Size screen = Get.size;
    return Scaffold(
      backgroundColor: kcWhite,
      body: Container(
        color: kcWhite,
        height: screen.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              image('logo.png'),
              width: screen.width * 0.5,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: LoadingIcon(height: spacer, color: kcPrimary),
            ),
          ],
        ),
      ),
    );
  }
}

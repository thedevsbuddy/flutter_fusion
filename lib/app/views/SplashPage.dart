import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/Config.dart';
import '../helpers/global.dart';
import 'layouts/AuthLayout.dart';
import 'widgets/Widgets.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screen = Get.size;

    redirectUser();

    return AuthLayout(
      body: Container(
        color: Get.theme.primaryColor,
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
              color: Colors.white,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: LoadingIconWidget(
                height: spacer8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void redirectUser() async {
    if (Config.authRequired) {
      if (auth.check()) {
        Future.delayed(
            Duration(seconds: 5), () => Get.offAllNamed('/dashboard'));
      } else {
        Future.delayed(Duration(seconds: 5), () => Get.offAllNamed('/login'));
      }
    } else {
      Future.delayed(Duration(seconds: 5), () => Get.offAllNamed('/dashboard'));
    }
  }
}

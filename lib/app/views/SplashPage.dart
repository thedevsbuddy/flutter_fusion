import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/Config.dart';
import '../helpers/global.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    redirectUser();
  }

  void redirectUser() async {
    if (Config.authRequired) {
      if (auth.check()) {
        await 5.delay(() => Get.offAllNamed('/dashboard'));
      } else {
        await 5.delay(() => Get.offAllNamed('/login'));
      }
    } else {
      await 5.delay(() => Get.offAllNamed('/dashboard'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = Get.size;
    return Scaffold(
      backgroundColor: kcPrimary,
      body: Container(
        color: kcPrimary,
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
              child: LoadingIconWidget(height: spacer, color: kcWhite),
            ),
          ],
        ),
      ),
    );
  }
}

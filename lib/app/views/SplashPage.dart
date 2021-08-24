import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/global.dart';
import 'layouts/AuthLayout.dart';
import 'widgets/Widgets.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = Get.size;
    return AuthLayout(
      body: Container(
        color: appTheme.primaryColor,
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
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

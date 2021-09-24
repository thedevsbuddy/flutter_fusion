import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/views/widgets/Widgets.dart';
import 'package:flutter_mvc/app/views/widgets/forms/TextInput.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../helpers/Global.dart';
import '../../helpers/TextStyles.dart';
import '../../helpers/adaptive_ui/adaptive_ui.dart';
import '../../views/layouts/AuthLayout.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdaptiveUI().init(context: context, height: Config.screenHeight, width: Config.screenWidth);

    var screen = Get.size;

    return AuthLayout(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            width: double.infinity,
            height: screen.height - 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    Container(
                      child: Image.asset(
                        image('logo_icon.png'),
                        width: 75,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Welcome Back,", style: TextStyles.title(context)!.copyWith(fontWeight: FontWeight.w700)),
                    SizedBox(height: 5),
                    Text("Sign in to continue", style: TextStyles.body(context)!.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    TextInput(
                      controller: authController.usernameInput,
                      hintText: "Username",
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    SizedBox(height: 25),
                    TextInput(
                      controller: authController.usernameInput,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      isPassword: true,
                    ),
                    SizedBox(height: 25),
                    Obx(
                      () => Button(
                        label: "Login",
                        onTap: () => authController.login(),
                        busy: authController.isLoading,
                        disabled: authController.isLoading,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   child: TextButton(
                      //     child: Text(
                      //       authController.isBusy ? "Loading..." : "Login",
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //     style: TextButton.styleFrom(
                      //       backgroundColor: Get.theme.accentColor,
                      //       padding: const EdgeInsets.symmetric(vertical: 12.0),
                      //     ),
                      //     onPressed: () {
                      //       authController.login();
                      //     },
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

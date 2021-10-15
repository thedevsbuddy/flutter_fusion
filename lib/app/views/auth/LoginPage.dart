import 'package:basic_ui/basic_ui.dart';
import 'package:adaptive_ui/adaptive_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../helpers/Global.dart';
import '../../views/layouts/AuthLayout.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdaptiveUI().init(
        context: context,
        height: Config.screenHeight,
        width: Config.screenWidth);

    var screen = Get.size;

    return AuthLayout(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => Keyboard.hide(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              color: Colors.transparent,
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
                      Text("Welcome Back,",
                          style: TextStyles.title(context)!
                              .copyWith(fontWeight: FontWeight.w700)),
                      SizedBox(height: 5),
                      Text("Sign in to continue",
                          style: TextStyles.body(context)!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      FormInput(
                        controller: authController.usernameInput,
                        placeholder: "Username",
                        leading: Icon(Icons.person_outline),
                      ),
                      SizedBox(height: 25),
                      FormInput.password(
                        controller: authController.usernameInput,
                        placeholder: "Password",
                        leading: Icon(Icons.lock_outline),
                      ),
                      SizedBox(height: 25),
                      Obx(
                        () => Button.block(
                          label: "Login",
                          onTap: () => authController.login(),
                          busy: authController.isLoading,
                          disabled: authController.isLoading,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

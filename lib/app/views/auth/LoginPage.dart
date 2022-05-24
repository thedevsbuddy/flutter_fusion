import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/LoginController.dart';
import '../../helpers/Global.dart';
import '../../views/layouts/AuthLayout.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
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
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Container(
                        child: Image.asset(
                          image('logo.png'),
                          width: 75,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text("Welcome Back,",
                          style: TextStyl.title(context)!
                              .copyWith(fontWeight: FontWeight.w700)),
                      SizedBox(height: 5),
                      Text("Sign in to continue",
                          style: TextStyl.body(context)!
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        FormInput.text(
                          controller: controller.identifierInput,
                          placeholder: "Username",
                          leading: Icon(Icons.person_outline),
                          validator: (value) => Validator("username", value!)
                              .specialCharacter()
                              .required()
                              .validate(),
                        ),
                        SizedBox(height: 25),
                        FormInput.password(
                          controller: controller.passwordInput,
                          placeholder: "Password",
                          leading: Icon(Icons.lock_outline),
                          validator: (value) => Validator("password", value!)
                              .required()
                              .validate(),
                          action: TextInputAction.done,
                        ),
                        SizedBox(height: 25),
                        Button.block(
                          key: UniqueKey(),
                          label: "Login",
                          onTap: (ButtonController btn) =>
                              controller.login(btn),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () => Get.offNamed("/register"),
                          child: Text.rich(
                            TextSpan(
                              text: "Don't have an account?",
                              style: TextStyl.button(context)?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.color),
                              children: [
                                TextSpan(
                                  text: " Join Now",
                                  style: TextStyl.button(context)?.copyWith(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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

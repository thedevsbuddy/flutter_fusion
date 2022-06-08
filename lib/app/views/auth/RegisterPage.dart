import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../helpers/Global.dart';
import '../../views/layouts/AuthLayout.dart';

class RegisterPage extends StatelessWidget {
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
                      Text("Welcome,", style: TextStyl.title!.copyWith(fontWeight: FontWeight.w700)),
                      SizedBox(height: 5),
                      Text("Create an account to continue.", style: TextStyl.body!.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Form(
                    // key: auth.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        FormInput.text(
                          controller: null,
                          placeholder: "Name",
                          leading: Icon(Icons.person_outline),
                          validator: (value) => Validator("Name", value!).required().validate(),
                        ),
                        SizedBox(height: 25),
                        FormInput.text(
                          controller: null,
                          placeholder: "Username",
                          leading: Icon(Icons.alternate_email_outlined),
                          validator: (value) => Validator("Username", value!).required().validate(),
                        ),
                        SizedBox(height: 25),
                        FormInput.email(
                          controller: null,
                          placeholder: "Email",
                          leading: Icon(Icons.email_outlined),
                          validator: (value) => Validator("Email", value!).email().required().validate(),
                        ),
                        SizedBox(height: 25),
                        FormInput.password(
                          controller: null,
                          placeholder: "Password",
                          leading: Icon(Icons.lock_outline),
                          validator: (value) => Validator("Password", value!).required().validate(),
                        ),
                        SizedBox(height: 25),
                        Button.block(
                          key: UniqueKey(),
                          label: "Register",
                          onTap: (btn) {
                            // btn.setBusy(true).setDisabled(true);
                            // authController.login();
                            // btn.setBusy(false).setDisabled(false);
                          },
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () => Get.offNamed("/login"),
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account?",
                              style: TextStyl.button?.copyWith(color: Theme.of(context).textTheme.bodyText1?.color),
                              children: [
                                TextSpan(
                                  text: " Login",
                                  style: TextStyl.button?.copyWith(color: Theme.of(context).primaryColor),
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

import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/views/widgets/Widgets.dart';
import 'package:flutter_mvc/app/views/widgets/forms/FormInput.dart';
import 'package:flutter_mvc/app/views/widgets/forms/FormSelect.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../helpers/Global.dart';
import '../../helpers/TextStyles.dart';
import '../../helpers/adaptive_ui/adaptive_ui.dart';
import '../../helpers/Keyboard.dart';
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
                        hintText: "Username",
                        leading: Icon(Icons.person_outline),
                      ),
                      SizedBox(height: 25),
                      FormInput.password(
                        controller: authController.usernameInput,
                        hintText: "Password",
                        leading: Icon(Icons.lock_outline),
                      ),
                      FormSelect(
                        options: [
                          DropdownMenuItem(child: Text('Item 1'), value: 1),
                          DropdownMenuItem(child: Text('Item 2'), value: 2),
                          DropdownMenuItem(child: Text('Item 3'), value: 3),
                        ],
                        value: 1,
                        onChanged: (value) {},
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

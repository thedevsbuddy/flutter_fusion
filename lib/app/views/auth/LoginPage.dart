import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../helpers/adaptive_ui/adaptive_ui.dart';
import '../../helpers/global.dart';
import '../../helpers/text_styles.dart';
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
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            width: double.infinity,
            height: screen.height,
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
                        image('starter_logo.png'),
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
                Form(
                  key: UniqueKey(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: null,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter an email to continue!";
                          } else if (!value.isEmail) {
                            return "Please enter a valid email!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        controller: null,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Password to continue!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Spacer(),
                          FlatButton(
                            child: Text(
                              "Forgot Password?",
                              style: Get.textTheme.button,
                            ),
                            color: Colors.transparent,
                            onPressed: () {
                              Get.offAllNamed('/forgot-password');
                            },
                          )
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        child: TextButton(
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Get.theme.accentColor,
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                          ),
                          onPressed: () {
                            // authController.login();
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: FlatButton(
                          child: Text(
                            "New user? Sign Up",
                            style: Get.textTheme.button,
                          ),
                          color: Colors.transparent,
                          onPressed: () {
                            Get.offAllNamed('/register');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

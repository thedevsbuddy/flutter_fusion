import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;

  AuthLayout({Key? key, required this.body, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}

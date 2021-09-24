import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({
    Key? key,
    this.controller,
    this.hintText = "Input hint",
    this.validator,
    this.prefixIcon,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: null,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
      obscureText: isPassword,
      validator: validator,
    );
  }
}

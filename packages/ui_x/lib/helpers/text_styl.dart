import 'package:flutter/material.dart';

class TextStyl {
  static TextStyle? heading1(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? heading2(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? heading3(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall;
  }

  static TextStyle? title(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium?.copyWith(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle? subtitle(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall?.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
        );
  }

  static TextStyle? body(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        );
  }

  static TextStyle? bodySm(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14.0);
  }

  static TextStyle? caption(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? button(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 14.0, fontWeight: FontWeight.w600, height: 1.07);
  }

  static TextStyle? label(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 14.0);
  }
}

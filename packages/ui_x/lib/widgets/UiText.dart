import 'package:flutter/material.dart';

import '../helpers/Helpers.dart';

class UiText extends StatelessWidget {
  const UiText(
    this.data, {
    super.key,
    this.style,
  });

  final TextStyle? style;
  final String data;

  UiText.heading(this.data) : this.style = TextStyl.heading1;

  @override
  Widget build(BuildContext context) {
    return Text(
      this.data,
      style: style,
    );
  }
}

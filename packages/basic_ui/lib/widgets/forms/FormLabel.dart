import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';

import '../../helpers/TextStyl.dart';

class FormLabel extends StatelessWidget {
  FormLabel({required this.label, this.color});

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$label",
      style: TextStyl.label(context)?.copyWith(color: color ?? kcDark),
    );
  }
}

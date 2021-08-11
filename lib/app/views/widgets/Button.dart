import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../helpers/adaptive_ui/adaptive_ui.dart';
import '../../helpers/text_styles.dart';

class Button extends StatelessWidget {
  final double? minWidth;
  final String label;
  final GestureTapCallback onPressed;
  final Color? color;
  final Color? labelColor;
  final ShapeBorder? shape;

  const Button(
      {Key? key,
      this.minWidth,
      required this.label,
      required this.onPressed,
      this.color,
      this.labelColor,
      this.shape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdaptiveUI().init(
        context: context,
        height: Config.screenHeight,
        width: Config.screenWidth);
    return MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      color: color,
      minWidth: minWidth,
      shape: shape,
      padding: EdgeInsets.symmetric(vertical: 14.0.h, horizontal: 16.0.w),
      child: Text(
        '$label',
        style: TextStyles.button?.copyWith(
          color: labelColor,
        ),
      ),
    );
  }
}

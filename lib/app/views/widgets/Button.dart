import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/views/widgets/LoadingIconWidget.dart';
import 'package:flutter_mvc/config/ColorPalette.dart';

import '../../helpers/TextStyles.dart';

// class Button extends StatelessWidget {
//   final double? minWidth;
//   final String label;
//   final GestureTapCallback onPressed;
//   final Color? color;
//   final Color? labelColor;
//   final ShapeBorder? shape;
//
//   const Button({Key? key, this.minWidth, required this.label, required this.onPressed, this.color, this.labelColor, this.shape}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AdaptiveUI().init(context: context, height: Config.screenHeight, width: Config.screenWidth);
//     return TextButton(
//       onPressed: onPressed,
//       style: TextButton.styleFrom(
//         backgroundColor: color,
//         padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.0.w),
//       ),
//       child: Text(
//         '$label',
//         style: TextStyles.button(context)?.copyWith(
//           color: labelColor,
//         ),
//       ),
//     );
//   }
// }

class Button extends StatelessWidget {
  final String label;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final bool block;
  final bool flat;

  const Button({
    Key? key,
    required this.label,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
  })  : outline = false,
        block = false,
        flat = false,
        super(key: key);

  const Button.outline({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
  })  : block = false,
        flat = false,
        outline = true;

  const Button.block({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
  })  : block = true,
        flat = false,
        outline = false;

  const Button.flat({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
  })  : block = false,
        flat = true,
        outline = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disabled ? onTap : () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: !outline
            ? BoxDecoration(
                color: !disabled ? Palette.primary : Palette.primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(!flat ? 8 : 0),
              )
            : BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                border: Border.all(
                  color: Palette.primary,
                  width: 1,
                ),
              ),
        child: !busy
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leading != null) leading!,
                  if (leading != null) SizedBox(width: 5),
                  Text(
                    label,
                    style: TextStyles.button(context)?.copyWith(
                      fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                      color: !outline ? Palette.white : Palette.primary,
                    ),
                  ),
                ],
              )
            : LoadingIconWidget(color: !outline ? Palette.white : Palette.primary),
      ),
    );
  }
}

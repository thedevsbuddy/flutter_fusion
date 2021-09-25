import 'package:flutter/material.dart';
import 'LoadingIconWidget.dart';
import '../../config/ColorPalette.dart';

import '../../helpers/TextStyles.dart';

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
    this.flat = false,
  })  : outline = false,
        block = false,
        super(key: key);

  const Button.outline({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
  })  : block = false,
        outline = true;

  const Button.outlineBlock({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
  })  : block = true,
        outline = true;

  const Button.block({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
  })  : block = true,
        outline = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disabled ? onTap : () {},
      child: block
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: !outline
                  ? BoxDecoration(
                      color: !disabled
                          ? Palette.primary
                          : Palette.primary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                      border: Border.all(
                        color: !disabled
                            ? Palette.primary
                            : Palette.primary.withOpacity(0.5),
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
                            fontWeight:
                                !outline ? FontWeight.bold : FontWeight.w400,
                            color: !outline ? Palette.white : Palette.primary,
                          ),
                        ),
                      ],
                    )
                  : LoadingIconWidget(
                      color: !outline ? Palette.white : Palette.primary),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  alignment: Alignment.center,
                  decoration: !outline
                      ? BoxDecoration(
                          color: !disabled
                              ? Palette.primary
                              : Palette.primary.withOpacity(0.5),
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
                                fontWeight: !outline
                                    ? FontWeight.bold
                                    : FontWeight.w400,
                                color:
                                    !outline ? Palette.white : Palette.primary,
                              ),
                            ),
                          ],
                        )
                      : LoadingIconWidget(
                          color: !outline ? Palette.white : Palette.primary),
                ),
              ],
            ),
    );
  }
}

import 'package:flutter/material.dart';

import '../helpers/TextStyles.dart';
import '../helpers/ColorPalette.dart';
import 'LoadingIconWidget.dart';

enum ButtonType {
  PRIMARY,
  SECONDARY,
  DANGER,
  SUCCESS,
  INFO,
  WARNING,
  DARK,
  LIGHT
}

class Button extends StatelessWidget {
  final String label;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final bool block;
  final bool flat;
  final ButtonType variant;

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
        variant = ButtonType.PRIMARY,
        super(key: key);

  const Button.outline({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.variant = ButtonType.PRIMARY,
  })  : block = false,
        outline = true;

  const Button.outlineBlock({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.variant = ButtonType.PRIMARY,
  })  : block = true,
        outline = true;

  const Button.block({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.variant = ButtonType.PRIMARY,
  })  : block = true,
        outline = false;

  const Button.primary({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.PRIMARY;

  const Button.secondary({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.SECONDARY;

  const Button.success({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.SUCCESS;

  const Button.danger({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.DANGER;

  const Button.info({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.INFO;

  const Button.warning({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.WARNING;

  const Button.dark({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.DARK;

  const Button.light({
    required this.label,
    this.onTap,
    this.leading,
    this.disabled = false,
    this.busy = false,
    this.flat = false,
    this.block = false,
    this.outline = false,
  }) : variant = ButtonType.LIGHT;

  @override
  Widget build(BuildContext context) {
    Color btnBgColor = variant == ButtonType.PRIMARY
        ? kcPrimary
        : (variant == ButtonType.SECONDARY)
            ? kcSecondary
            : (variant == ButtonType.DANGER)
                ? kcDanger
                : (variant == ButtonType.SUCCESS)
                    ? kcSuccess
                    : (variant == ButtonType.INFO)
                        ? kcInfo
                        : (variant == ButtonType.WARNING)
                            ? kcWarning
                            : (variant == ButtonType.DARK)
                                ? kcDarker
                                : (variant == ButtonType.LIGHT)
                                    ? kcOffWhite
                                    : kcPrimary;

    Color btnTxtColor = variant == ButtonType.PRIMARY
        ? kcWhite
        : (variant == ButtonType.SECONDARY)
            ? kcWhite
            : (variant == ButtonType.DANGER)
                ? kcWhite
                : (variant == ButtonType.SUCCESS)
                    ? kcWhite
                    : (variant == ButtonType.INFO)
                        ? kcWhite
                        : (variant == ButtonType.WARNING)
                            ? kcDarker
                            : (variant == ButtonType.DARK)
                                ? kcWhite
                                : (variant == ButtonType.LIGHT)
                                    ? kcDarker
                                    : kcWhite;

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
                      color:
                          !disabled ? btnBgColor : btnBgColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                      border: Border.all(
                        color: !disabled
                            ? btnBgColor
                            : btnBgColor.withOpacity(0.5),
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
                            color: !outline ? btnTxtColor : btnBgColor,
                          ),
                        ),
                      ],
                    )
                  : LoadingIconWidget(
                      color: !outline ? btnTxtColor : btnBgColor),
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
                              ? btnBgColor
                              : btnBgColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                          border: Border.all(
                            color: btnBgColor,
                            width: 1,
                          ),
                        )
                      : BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                          border: Border.all(
                            color: btnBgColor,
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
                                color: !outline ? btnTxtColor : btnBgColor,
                              ),
                            ),
                          ],
                        )
                      : LoadingIconWidget(
                          color: !outline ? btnTxtColor : btnBgColor),
                ),
              ],
            ),
    );
  }
}

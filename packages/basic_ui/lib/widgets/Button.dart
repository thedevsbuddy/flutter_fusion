import 'package:flutter/material.dart';

import '../helpers/ColorPalette.dart';
import '../helpers/TextStyl.dart';
import 'LoadingIcon.dart';

enum ButtonVariant { PRIMARY, SECONDARY, DANGER, SUCCESS, INFO, WARNING, DARK, LIGHT }

class Button extends StatefulWidget {
  late final _ButtonState btnState;

  final String label;
  final void Function(_ButtonState)? onTap;
  final bool outline;
  final Widget? leading;
  final Widget? loadingIcon;
  final bool block;
  final bool flat;
  final ButtonVariant variant;

  Button({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
  })  : outline = false,
        block = false,
        variant = ButtonVariant.PRIMARY,
        super(key: key);

  Button.outline({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.variant = ButtonVariant.PRIMARY,
  })  : block = false,
        outline = true,
        super(key: key);

  Button.outlineBlock({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.variant = ButtonVariant.PRIMARY,
  })  : block = true,
        outline = true,
        super(key: key);

  Button.block({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.variant = ButtonVariant.PRIMARY,
  })  : block = true,
        outline = false,
        super(key: key);

  Button.primary({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.PRIMARY,
        super(key: key);

  Button.secondary({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.SECONDARY,
        super(key: key);

  Button.success({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.SUCCESS,
        super(key: key);

  Button.danger({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.DANGER,
        super(key: key);

  Button.info({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.INFO,
        super(key: key);

  Button.warning({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.WARNING,
        super(key: key);

  Button.dark({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.DARK,
        super(key: key);

  Button.light({
    Key? key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.LIGHT,
        super(key: key);

  @override
  State<Button> createState() {
    btnState = _ButtonState();
    return btnState;
  }
}

class _ButtonState extends State<Button> {
  bool isBusy = false;
  bool isDisabled = false;

  setBusy(bool val) {
    setState(() {
      isBusy = val;
    });
    return widget.btnState;
  }

  setDisabled(bool val) {
    setState(() {
      isDisabled = val;
    });
    return widget.btnState;
  }

  @override
  Widget build(BuildContext context) {
    Color btnBgColor = widget.variant == ButtonVariant.PRIMARY
        ? kcPrimary
        : (widget.variant == ButtonVariant.SECONDARY)
            ? kcSecondary
            : (widget.variant == ButtonVariant.DANGER)
                ? kcDanger
                : (widget.variant == ButtonVariant.SUCCESS)
                    ? kcSuccess
                    : (widget.variant == ButtonVariant.INFO)
                        ? kcInfo
                        : (widget.variant == ButtonVariant.WARNING)
                            ? kcWarning
                            : (widget.variant == ButtonVariant.DARK)
                                ? kcDarker
                                : (widget.variant == ButtonVariant.LIGHT)
                                    ? kcOffWhite
                                    : kcPrimary;

    Color btnTxtColor = widget.variant == ButtonVariant.PRIMARY
        ? kcWhite
        : (widget.variant == ButtonVariant.SECONDARY)
            ? kcWhite
            : (widget.variant == ButtonVariant.DANGER)
                ? kcWhite
                : (widget.variant == ButtonVariant.SUCCESS)
                    ? kcWhite
                    : (widget.variant == ButtonVariant.INFO)
                        ? kcWhite
                        : (widget.variant == ButtonVariant.WARNING)
                            ? kcDarker
                            : (widget.variant == ButtonVariant.DARK)
                                ? kcWhite
                                : (widget.variant == ButtonVariant.LIGHT)
                                    ? kcDarker
                                    : kcWhite;

    return GestureDetector(
      onTap: () {
        if (!isBusy && !isDisabled) {
          widget.onTap!(widget.btnState);
        }
      },
      child: widget.block
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: !widget.outline
                  ? BoxDecoration(
                      color: !isDisabled ? btnBgColor : btnBgColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(!widget.flat ? 8 : 0),
                    )
                  : BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(!widget.flat ? 8 : 0),
                      border: Border.all(
                        color: !isDisabled ? btnBgColor : btnBgColor.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
              child: !isBusy
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.leading != null) widget.leading!,
                        if (widget.leading != null) SizedBox(width: 5),
                        Text(
                          widget.label,
                          style: TextStyl.button(context)?.copyWith(
                            fontWeight: !widget.outline ? FontWeight.bold : FontWeight.w400,
                            color: !widget.outline ? btnTxtColor : btnBgColor,
                          ),
                        ),
                      ],
                    )
                  : widget.loadingIcon != null
                      ? SizedBox(height: 20, width: 20, child: widget.loadingIcon)
                      : LoadingIcon(
                          color: !widget.outline ? btnTxtColor : btnBgColor,
                          height: 16,
                        ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                  alignment: Alignment.center,
                  decoration: !widget.outline
                      ? BoxDecoration(
                          color: !isDisabled ? btnBgColor : btnBgColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(!widget.flat ? 8 : 0),
                          border: Border.all(
                            color: btnBgColor,
                            width: 1,
                          ),
                        )
                      : BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(!widget.flat ? 8 : 0),
                          border: Border.all(
                            color: btnBgColor,
                            width: 1,
                          ),
                        ),
                  child: !isBusy
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.leading != null) widget.leading!,
                            if (widget.leading != null) SizedBox(width: 5),
                            Text(
                              widget.label,
                              style: TextStyl.button(context)?.copyWith(
                                fontWeight: !widget.outline ? FontWeight.bold : FontWeight.w400,
                                color: !widget.outline ? btnTxtColor : btnBgColor,
                              ),
                            ),
                          ],
                        )
                      : widget.loadingIcon != null
                          ? SizedBox(height: 20, width: 20, child: widget.loadingIcon)
                          : LoadingIcon(
                              color: !widget.outline ? btnTxtColor : btnBgColor,
                              height: 16,
                            ),
                ),
              ],
            ),
    );
  }
}

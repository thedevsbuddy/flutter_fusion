import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/ColorPalette.dart';
import '../../helpers/TextStyl.dart';
import '../LoadingIcon.dart';

enum ButtonVariant { PRIMARY, SECONDARY, DANGER, SUCCESS, INFO, WARNING, DARK, LIGHT }

class Button extends StatelessWidget {
  final String label;
  final void Function(ButtonController)? onTap;
  final bool outline;
  final Widget? leading;
  final Widget? loadingIcon;
  final bool block;
  final bool flat;
  final ButtonVariant variant;

  Button({
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
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
    required Key key,
    required this.label,
    this.onTap,
    this.leading,
    this.loadingIcon,
    this.flat = false,
    this.block = false,
    this.outline = false,
  })  : variant = ButtonVariant.LIGHT,
        super(key: key);

  final ButtonController btnController = Get.find<ButtonController>();

  @override
  Widget build(BuildContext context) {
    Color btnBgColor = variant == ButtonVariant.PRIMARY
        ? kcPrimary
        : (variant == ButtonVariant.SECONDARY)
            ? kcSecondary
            : (variant == ButtonVariant.DANGER)
                ? kcDanger
                : (variant == ButtonVariant.SUCCESS)
                    ? kcSuccess
                    : (variant == ButtonVariant.INFO)
                        ? kcInfo
                        : (variant == ButtonVariant.WARNING)
                            ? kcWarning
                            : (variant == ButtonVariant.DARK)
                                ? kcDarker
                                : (variant == ButtonVariant.LIGHT)
                                    ? kcOffWhite
                                    : kcPrimary;

    Color btnTxtColor = variant == ButtonVariant.PRIMARY
        ? kcWhite
        : (variant == ButtonVariant.SECONDARY)
            ? kcWhite
            : (variant == ButtonVariant.DANGER)
                ? kcWhite
                : (variant == ButtonVariant.SUCCESS)
                    ? kcWhite
                    : (variant == ButtonVariant.INFO)
                        ? kcWhite
                        : (variant == ButtonVariant.WARNING)
                            ? kcDarker
                            : (variant == ButtonVariant.DARK)
                                ? kcWhite
                                : (variant == ButtonVariant.LIGHT)
                                    ? kcDarker
                                    : kcWhite;

    return Obx(
      () => GestureDetector(
        onTap: () => onTap!(btnController),
        child: block
            ? AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: !outline
                    ? BoxDecoration(
                        color: !btnController.isDisabled ? btnBgColor : btnBgColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                      )
                    : BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(!flat ? 8 : 0),
                        border: Border.all(
                          color: !btnController.isDisabled ? btnBgColor : btnBgColor.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                child: !btnController.isBusy
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (leading != null) leading!,
                          if (leading != null) SizedBox(width: 5),
                          Text(
                            label,
                            style: TextStyl.button?.copyWith(
                              fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                              color: !outline ? btnTxtColor : btnBgColor,
                            ),
                          ),
                        ],
                      )
                    : loadingIcon != null
                        ? SizedBox(height: 20, width: 20, child: loadingIcon)
                        : LoadingIcon(
                            color: !outline ? btnTxtColor : btnBgColor,
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
                    decoration: !outline
                        ? BoxDecoration(
                            color: !btnController.isDisabled ? btnBgColor : btnBgColor.withOpacity(0.5),
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
                    child: !btnController.isBusy
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (leading != null) leading!,
                              if (leading != null) SizedBox(width: 5),
                              Text(
                                label,
                                style: TextStyl.button?.copyWith(
                                  fontWeight: !outline ? FontWeight.bold : FontWeight.w400,
                                  color: !outline ? btnTxtColor : btnBgColor,
                                ),
                              ),
                            ],
                          )
                        : loadingIcon != null
                            ? SizedBox(height: 20, width: 20, child: loadingIcon)
                            : LoadingIcon(
                                color: !outline ? btnTxtColor : btnBgColor,
                                height: 16,
                              ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ButtonController extends GetxController {
  RxBool _isBusy = RxBool(false);
  RxBool _isDisabled = RxBool(false);

  bool get isBusy => _isBusy.value;
  bool get isDisabled => _isDisabled.value;

  ButtonController setBusy(bool val) {
    _isBusy(val);
    return this;
  }

  ButtonController setDisabled(bool val) {
    _isDisabled(val);
    return this;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/adaptive_ui/adaptive_ui.dart';
import '../../helpers/text_styles.dart';
import '../../../config/color_palette.dart';
import '../../../config/config.dart';
import '../../controllers/ThemeController.dart';
import '../layouts/MasterLayout.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdaptiveUI().init(
        context: context,
        height: Config.screenHeight,
        width: Config.screenWidth);
    final Size screen = Get.size;
    return MasterLayout(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Theme:',
                    style: TextStyles.body(context),
                  ),
                  Spacer(),
                  GetBuilder<ThemeController>(builder: (controller) {
                    return Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: "light",
                              groupValue: controller.currentTheme,
                              onChanged: (value) {
                                controller.setThemeMode(value.toString());
                              },
                              activeColor: Palette.accent,
                            ),
                            Text(
                              'Light',
                              style: TextStyles.body(context),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "dark",
                              groupValue: controller.currentTheme,
                              onChanged: (value) {
                                controller.setThemeMode(value.toString());
                              },
                              activeColor: Palette.accent,
                            ),
                            Text(
                              'Dark',
                              style: TextStyles.body(context),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: "system",
                              groupValue: controller.currentTheme,
                              onChanged: (value) {
                                controller.setThemeMode(value.toString());
                              },
                              activeColor: Palette.accent,
                            ),
                            Text(
                              'System',
                              style: TextStyles.body(context),
                            )
                          ],
                        )
                      ],
                    );
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

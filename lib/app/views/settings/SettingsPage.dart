import 'package:adaptive_ui/adaptive_ui.dart';
import 'package:basic_ui/basic_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/controllers/SettingController.dart';
import 'package:flutter_mvc/app/views/errors/NotConnectedErrorPage.dart';
import 'package:flutter_mvc/app/views/widgets/LoadingIconWidget.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../layouts/MasterLayout.dart';

class SettingsPage extends StatelessWidget {
  final SettingController controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    AdaptiveUI().init(context: context, height: Config.screenHeight, width: Config.screenWidth);
    final Size screen = Get.size;
    return Obx(
      () => !controller.isConnected
          ? NotConnectedErrorPage()
          : controller.isBusy
              ? LoadingIconWidget(message: "Please wait...")
              : MasterLayout(
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(12.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Theme",
                            style: TextStyl.bodySm(context),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.changeTheme(context, "system"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: controller.selectedTheme == 'system' ? kcPrimary : Colors.transparent, width: 2),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.brightness_4_rounded, size: 32),
                                        Text(
                                          'System',
                                          style: TextStyl.bodySm(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.changeTheme(context, "light"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: controller.selectedTheme == 'light' ? kcPrimary : Colors.transparent, width: 2),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.brightness_5_rounded, size: 32),
                                        Text(
                                          'Light',
                                          style: TextStyl.bodySm(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => controller.changeTheme(context, "dark"),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).backgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: controller.selectedTheme == 'dark' ? kcPrimary : Colors.transparent, width: 2),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.brightness_2_rounded, size: 32),
                                        Text(
                                          'Dark',
                                          style: TextStyl.bodySm(context),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/global.dart';
import '../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../controllers/settings_controller.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (SettingsController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : MasterLayout(
                    title: "Settings",
                    body: SafeArea(
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
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
                                  child: InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () => controller.changeTheme(
                                        context, "system"),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: controller.selectedTheme ==
                                                    'system'
                                                ? kcPrimary
                                                : Colors.transparent,
                                            width: 2),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(Icons.brightness_4_rounded,
                                              size: 32),
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
                                  child: InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () => controller.changeTheme(
                                        context, "light"),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: controller.selectedTheme ==
                                                    'light'
                                                ? kcPrimary
                                                : Colors.transparent,
                                            width: 2),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(Icons.brightness_5_rounded,
                                              size: 32),
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
                                  child: InkWell(
                                    splashFactory: NoSplash.splashFactory,
                                    onTap: () =>
                                        controller.changeTheme(context, "dark"),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: controller.selectedTheme ==
                                                    'dark'
                                                ? kcPrimary
                                                : Colors.transparent,
                                            width: 2),
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(Icons.brightness_2_rounded,
                                              size: 32),
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
                            const SizedBox(height: 16),
                            Text(
                              "Account",
                              style: TextStyl.bodySm(context),
                            ),
                            const SizedBox(height: 4),
                            InkWell(
                              onTap: auth.logout,
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                child: Text(
                                  "Logout",
                                  style: TextStyl.button(context),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
      },
    );
  }
}

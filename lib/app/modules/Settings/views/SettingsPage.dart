import 'package:flutter/material.dart';
import 'package:flutter_fusion/app/helpers/Global.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/widgets/LoadingIconWidget.dart';
import '../controllers/SettingsController.dart';

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                            child: Text(
                              "Account",
                              style: TextStyl.bodySm(context),
                            ),
                          ),
                          InkWell(
                            onTap: auth.logout,
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Text(
                                "Logout",
                                style: TextStyl.button(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}

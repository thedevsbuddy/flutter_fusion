import 'package:flutter/material.dart';
import '../../Modules.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/views/errors/NotConnectedErrorPage.dart';
import '../../../shared/views/layouts/MasterLayout.dart';
import '../../../shared/views/widgets/Widgets.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return !controller.isConnected
            ? NotConnectedErrorPage()
            : controller.isBusy
                ? LoadingIconWidget(message: "Please wait...")
                : MasterLayout(
                    title: "Dashboard",
                    actions: [
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                          Get.toNamed(SettingsRoutes.settings);
                        },
                      ),
                    ],
                    body: Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Center(
                          child: Container(
                            width: double.maxFinite,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'I am a dashboard',
                                  style: TextStyl.subtitle(context),
                                ),
                                SizedBox(height: spacer),
                                Text('Create awesome application'),
                              ],
                            ),
                          ),
                        )),
                  );
      },
    );
  }
}

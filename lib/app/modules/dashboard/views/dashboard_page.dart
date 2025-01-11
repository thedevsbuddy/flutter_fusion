import 'package:flutter/material.dart';
import '../../modules.dart';
import 'package:get/get.dart';
import 'package:ui_x/ui_x.dart';

import '../../../shared/views/errors/not_connected_error_page.dart';
import '../../../shared/views/layouts/master_layout.dart';
import '../../../shared/views/widgets/widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
                          child: SizedBox(
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

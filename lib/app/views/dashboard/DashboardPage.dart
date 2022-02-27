import 'package:adaptive_ui/adaptive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/app/controllers/DashboardController.dart';
import 'package:flutter_mvc/app/views/errors/NotConnectedErrorPage.dart';
import 'package:flutter_mvc/app/views/widgets/LoadingIconWidget.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../layouts/MasterLayout.dart';

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    AdaptiveUI().init(context: context, height: Config.screenHeight, width: Config.screenWidth);
    // final Size screen = Get.size;
    return Obx(
      () => !controller.isConnected
          ? NotConnectedErrorPage()
          : controller.isBusy
              ? LoadingIconWidget(message: "Please wait...")
              : MasterLayout(
                  title: "Dashboard",
                  body: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(12.0.w),
                      child: Column(
                        children: [],
                      ),
                    ),
                  ),
                ),
    );
  }
}

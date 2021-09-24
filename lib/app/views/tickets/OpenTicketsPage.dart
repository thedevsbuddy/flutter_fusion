import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/Config.dart';
import '../../helpers/adaptive_ui/adaptive_ui.dart';
import '../layouts/MasterLayout.dart';

class OpenTicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AdaptiveUI().init(context: context, height: Config.screenHeight, width: Config.screenWidth);
    final Size screen = Get.size;
    return MasterLayout(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0.w),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}

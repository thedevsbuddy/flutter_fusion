import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvc/app/helpers/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/ThemeController.dart';
import 'app/controllers/auth/AuthController.dart';
import 'app/views/views.dart';
import 'config/config.dart';
import 'config/theme/AppTheme.dart';
import 'routes/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the storage
  await GetStorage.init();
  // Initialize Theme controller
  Get.put(ThemeController());
  // Initialize Auth controller
  Get.put(AuthController());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeft,
        title: "${Config.appName}",
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: SplashPage(),
        getPages: routes,
      );
  }
}

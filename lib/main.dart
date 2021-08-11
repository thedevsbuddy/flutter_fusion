import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/auth/AuthController.dart';
import 'app/views/views.dart';
import 'config/app_theme.dart';
import 'config/config.dart';
import 'routes/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the storage
  await GetStorage.init();
  // Initialize Get Storage
  GetStorage storage = GetStorage();

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
      theme: AppTheme.appTheme,
      themeMode: ThemeMode.light,
      home: SplashPage(),
      getPages: routes,
    );
  }
}

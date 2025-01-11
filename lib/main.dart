import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/shared/controllers/auth_state.dart';
import 'app/shared/views/widgets/theme_builder.dart';
import 'config/config.dart';
import 'config/common/app_http_overrides.dart';
import 'config/theme/app_theme.dart';
import 'routes/router.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = AppHttpOverrides();

  /// Initialize the storage
  await GetStorage.init();

  /// Initialize [AuthState]
  Get.put<AuthState>(AuthState(), permanent: true);

  /// Set and lock device Orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        statusBarBrightness: Theme.of(context).brightness,
      ),
    );

    return ThemeBuilder(
      builder: (context, _themeMode) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fadeIn,
          title: "${Config.appName}",
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: _themeMode,
          initialRoute: Routes.splash,
          getPages: routes,
        );
      },
    );
  }
}

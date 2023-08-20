import 'dart:io';

// import 'package:fire_connect/fire_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/shared/controllers/AuthState.dart';
import 'app/shared/views/widgets/ThemeBuilder.dart';
import 'config/Config.dart';
import 'config/common/MyHttpOverrides.dart';
import 'config/theme/AppTheme.dart';
import 'routes/Router.dart';
import 'routes/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  // FireConnect _fireConnect = FireConnect();
  // await _fireConnect.init();

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
        statusBarColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
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



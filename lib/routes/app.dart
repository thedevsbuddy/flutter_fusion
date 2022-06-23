import 'package:get/get.dart';

import '../app/modules/Modules.dart';
import 'middlewares/AuthMiddleware.dart';

List<GetPage> routes = [
  ///================================
  /// Splash Routes
  /// ===============================
  GetPage(name: '/', page: () => SplashPage()),

  ///================================
  /// Auth Routes
  /// ===============================
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/register', page: () => RegisterPage()),

  ///=======================================================///

  ///================================
  /// Setting Page Route
  /// ===============================
  GetPage(name: '/dashboard', page: () => DashboardPage(), middlewares: [AuthMiddleware()]),

  ///================================
  /// Setting Page Route
  /// ===============================
  GetPage(name: '/settings', page: () => SettingsPage()),
];

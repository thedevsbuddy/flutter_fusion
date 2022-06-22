import 'package:get/get.dart';

import '../app/modules/auth/views/LoginPage.dart';
import '../app/modules/auth/views/RegisterPage.dart';
import '../app/views/views.dart';

List<GetPage> routes = [
  ///================================
  /// Auth Routes
  /// ===============================
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/register', page: () => RegisterPage()),

  ///=======================================================///

  ///================================
  /// Setting Page Route
  /// ===============================
  GetPage(name: '/dashboard', page: () => DashboardPage()),

  ///================================
  /// Setting Page Route
  /// ===============================
  GetPage(name: '/settings', page: () => SettingsPage()),
];

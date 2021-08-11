import 'package:get/get.dart';

import '../views/views.dart';

List<GetPage> routes = [
  // Auth Routes
  GetPage(name: '/login', page: () => LoginPage()),
  // GetPage(name: '/register', page: () => RegisterPage()),
  GetPage(name: '/forgot-password', page: () => ForgotPasswordPage()),

  /*=======================================================*/

  // Setting Page Route
  GetPage(
      name: '/settings',
      page: () => SettingPage(),
      transition: Transition.downToUp),

  // Setting Page Route
  GetPage(
      name: '/home', page: () => HomePage(), transition: Transition.downToUp),
];

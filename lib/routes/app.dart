import 'package:get/get.dart';

import '../app/views/views.dart';

List<GetPage> routes = [
  // Auth Routes
  GetPage(name: '/login', page: () => LoginPage()),

  /*=======================================================*/

  // Setting Page Route
  GetPage(name: '/settings', page: () => SettingsPage()),
];

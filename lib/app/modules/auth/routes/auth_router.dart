import 'package:get/get.dart';

import '../auth_module.dart';

List<GetPage> authRoutes = [
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/register', page: () => RegisterPage()),
];

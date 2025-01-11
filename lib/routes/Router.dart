import 'package:get/get.dart';

import '../app/modules/modules.dart';

List<GetPage> routes = [
  /// Basic Routes
  ...splashRoutes,

  /// Auth Routes
  ...authRoutes,

  /// Dashboard Routes
  ...dashboardRoutes,

  /// Setting Routes
  ...settingsRoutes,

  /// Profile Routes
  ...profileRoutes,
];

import 'package:dcli/dcli.dart';
import 'package:modulr/Module/Module.dart' as modulrModule;
import 'package:modulr/Module/controllers/ModuleController.dart' as modulrController;
import 'package:modulr/Module/route/Route.dart' as modulrRoute;
import 'package:modulr/Module/services/AppModuleService.dart' as modulrAppService;
import 'package:modulr/Module/services/MockModuleService.dart' as modulrMockService;
import 'package:modulr/Module/services/ModuleService.dart' as modulrService;
import 'package:modulr/Module/views/ModulePage.dart' as modulrView;

import 'utilities/Utils.dart';

String moduleName = "";
String modulePath = "";
String controllerPath = "";
String servicePath = "";
String viewPath = "";
String routePath = "";

Future<void> generate(List<String> args) async {
  /// Assign variable values
  moduleName = args.first;
  modulePath = "lib/app/modules/${Utils.ucFirst(moduleName)}";
  controllerPath = "lib/app/modules/${Utils.ucFirst(moduleName)}/controllers";
  servicePath = "lib/app/modules/${Utils.ucFirst(moduleName)}/services";
  viewPath = "lib/app/modules/${Utils.ucFirst(moduleName)}/views";
  routePath = "lib/app/modules/${Utils.ucFirst(moduleName)}/route";

  /// Generate Controller
  await generateController();

  /// Generate Route
  await generateModuleClass();

  /// Generate Services
  await generateService();

  /// Generate Views
  await generateView();

  /// Generate Route
  await generateRoute();
}

/// Generate ModuleController
Future<void> generateController() async {
  /// Check and create directory
  Utils.makeDir(controllerPath);

  String _controllerFile = modulrController.stub.replaceAll('{MODULE}', Utils.ucFirst(moduleName));
  _controllerFile = _controllerFile.replaceAll('{CAMEL_MODULE}', moduleName.toLowerCase());

  /// Write File
  Utils.writeFile("$controllerPath/${Utils.ucFirst(moduleName)}Controller.dart", _controllerFile);

  /// Show Success message
  print(green('"$controllerPath/${Utils.ucFirst(moduleName)}Controller.dart" generated successfully!'));
}

/// Generate ModuleClass
Future<void> generateModuleClass() async {
  /// Check and create directory
  Utils.makeDir(modulePath);

  String _moduleFile = modulrModule.stub.replaceAll('{MODULE}', Utils.ucFirst(moduleName));

  /// Write File
  Utils.writeFile("$modulePath/${Utils.ucFirst(moduleName)}Module.dart", _moduleFile);

  /// Show Success message
  print(green('"$modulePath/${Utils.ucFirst(moduleName)}Module.dart" generated successfully!'));
}

/// Generate [ModuleService]
Future<void> generateService() async {
  /// Check and create directory
  Utils.makeDir(servicePath);

  String _serviceFile = modulrService.stub.replaceAll('{MODULE}', Utils.ucFirst(moduleName, preserveAfter: true));
  String _serviceMockFile = modulrMockService.stub.replaceAll('{MODULE}', Utils.ucFirst(moduleName, preserveAfter: true));
  String _serviceAppFile = modulrAppService.stub.replaceAll('{MODULE}', Utils.ucFirst(moduleName, preserveAfter: true));

  /// Write File
  Utils.writeFile("$servicePath/${Utils.ucFirst(moduleName, preserveAfter: true)}Service.dart", _serviceFile);
  Utils.writeFile("$servicePath/Mock${Utils.ucFirst(moduleName, preserveAfter: true)}Service.dart", _serviceMockFile);
  Utils.writeFile("$servicePath/App${Utils.ucFirst(moduleName, preserveAfter: true)}Service.dart", _serviceAppFile);

  /// Show Success message
  print(green('"$servicePath/${Utils.ucFirst(moduleName, preserveAfter: true)}Service.dart" generated successfully.'));
  print(green('"$servicePath/Mock${Utils.ucFirst(moduleName, preserveAfter: true)}Service.dart" generated successfully.'));
  print(green('"$servicePath/App${Utils.ucFirst(moduleName, preserveAfter: true)}Service.dart" generated successfully.'));
}

/// Generate ModuleView
Future<void> generateView() async {
  /// Check and create directory
  Utils.makeDir(viewPath);

  /// Process View File
  String _viewFile = modulrView.stub.replaceAll('{MODULE}', Utils.ucFirst(moduleName));

  /// Write File
  Utils.writeFile("$viewPath/${Utils.ucFirst(moduleName)}Page.dart", _viewFile);

  /// Show Success message
  print(green('"$viewPath/${Utils.ucFirst(moduleName)}Page.dart" generated successfully!'));
}

/// Generate ModuleRoute
Future<void> generateRoute() async {
  /// Check and create directory
  Utils.makeDir(routePath);

  /// Process Route File
  String _routeFile = modulrRoute.stub.replaceAll('{MODULE}', Utils.ucFirst(moduleName));
  _routeFile = _routeFile.replaceAll('{MODULE_URL}', Utils.snake(moduleName));
  _routeFile = _routeFile.replaceAll('{CAMEL_MODULE}', moduleName.toLowerCase());

  /// Write File
  Utils.writeFile("$routePath/${Utils.ucFirst(moduleName)}Route.dart", _routeFile);

  /// Show Success message
  print(green('"$routePath/${Utils.ucFirst(moduleName)}Route.dart" generated successfully!'));
}

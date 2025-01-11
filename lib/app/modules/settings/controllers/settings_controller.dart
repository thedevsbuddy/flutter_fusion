import 'package:get/get.dart';

import '../../../helpers/global.dart';
import '../../../shared/controllers/app_controller.dart';
import '../../../shared/views/widgets/theme_builder.dart';

class SettingsController extends AppController {
  static SettingsController get instance {
    if (!Get.isRegistered<SettingsController>()) Get.put(SettingsController());
    return Get.find<SettingsController>();
  }

  /// Observables
  RxString _selectedTheme = "system".obs;

  /// Getters
  String get selectedTheme => this._selectedTheme.value;

  @override
  void onInit() {
    super.onInit();
    _selectedTheme(storage.read('theme_mode'));
  }

  /// Theme Switcher
  void changeTheme(context, themeMode) {
    _selectedTheme(themeMode);
    ThemeBuilder.of(context)?.changeThemeTo(_selectedTheme.value);
  }
}

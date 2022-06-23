import 'package:get/get.dart';

import '../../../helpers/Global.dart';
import '../../../shared/controllers/AppController.dart';
import '../../../shared/views/widgets/ThemeBuilder.dart';

class SettingController extends AppController {
  static SettingController get instance => Get.find();

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

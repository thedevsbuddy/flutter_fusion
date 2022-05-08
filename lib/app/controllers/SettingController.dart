import 'package:basic_ui/basic_ui.dart';
import 'package:flutter_mvc/app/controllers/AppController.dart';
import 'package:flutter_mvc/app/helpers/Global.dart';
import 'package:flutter_mvc/app/views/widgets/ThemeBuilder.dart';
import 'package:get/get.dart';

class SettingController extends AppController {
  static SettingController get to => Get.find();

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
    Toastr.show(message: "ThemeMode updated to $themeMode");
  }
}

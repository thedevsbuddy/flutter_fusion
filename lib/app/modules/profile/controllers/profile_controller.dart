import 'package:get/get.dart';

import '../../../shared/controllers/app_controller.dart';
import '../../modules.dart';

class ProfileController extends AppController {
  /// Create and get the instance of the controller
  static ProfileController get instance {
    if (!Get.isRegistered<ProfileController>()) Get.put(ProfileController());
    return Get.find<ProfileController>();
  }

  /// Initialise [ProfileModule] service
  final ProfileService _profileService = ProfileService.instance;

  /// Observables
  final _exampleBool = false.obs;

  /// Getters
  bool get exampleBool => _exampleBool.value;

  @override
  void onInit() {
    super.onInit();

    /// Do something here
    getData();
  }

  Future<void> getData() async {
    _profileService.init('getData');
    await _profileService.getData();
    _profileService.close('getData');
  }
}

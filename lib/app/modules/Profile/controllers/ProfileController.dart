import 'dart:math';

import 'package:flutter_fusion/app/models/ApiResponse.dart';
import 'package:get/get.dart';

import '../../../shared/controllers/AppController.dart';
import '../../Modules.dart';
import '../services/ProfileService.dart';

class ProfileController extends AppController {
  /// Create and get the instance of the controller
  static ProfileController get instance {
    if (!Get.isRegistered<ProfileController>()) Get.put(ProfileController());
    return Get.find<ProfileController>();
  }

  /// Initialise [ProfileModule] service
  final ProfileService _profileService = ProfileService.instance;

  /// Observables
  var _exampleBool = false.obs;

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
    ApiResponse response = await _profileService.getData();
    print(response.toJson());
    _profileService.close('getData');
  }
}

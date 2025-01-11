import '../../../models/api_response.dart';
import 'package:get/get.dart';

import 'api_profile_service.dart';
import 'local_profile_service.dart';

abstract class ProfileService {
  /// Configure if Mock is enabled or not @accepts[true|false]
  static const mockEnabled = false;

  /// Create and get the instance of [ProfileService]
  static ProfileService get instance {
    if (!Get.isRegistered<ProfileService>())
      Get.lazyPut<ProfileService>(
          () => mockEnabled ? LocalProfileService() : ApiProfileService());
    return Get.find<ProfileService>();
  }

  /// Start the server request
  void init(String client);

  /// Stop the server request
  void close(String client);

  /// Do Something
  Future<ApiResponse> getData();
}

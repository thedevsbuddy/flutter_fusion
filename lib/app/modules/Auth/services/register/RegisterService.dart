import 'package:flutter_mvc/app/models/ApiResponse.dart';
import 'package:get/get.dart';

export 'AppRegisterService.dart';
export 'MockRegisterService.dart';

abstract class RegisterService {
  /// Configure if Mock is enabled or not
  static const MOCK_ENABLED = true;

  /// Create and get the instance of [RegisterService]
  static RegisterService get instance {
    return Get.find<RegisterService>();
  }

  /// Register user
  Future<ApiResponse> submit({required Map<String, dynamic> body});
}

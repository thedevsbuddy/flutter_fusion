import 'package:get/get_utils/get_utils.dart';

import '../../../../models/ApiResponse.dart';
import 'RegisterService.dart';

class MockRegisterService implements RegisterService {
  @override
  Future<ApiResponse> submit({required Map<String, dynamic> body}) async {
    return await Future.delayed(2.seconds, () {
      return ApiResponse(
        status: "success",
        message: "Welcome! You are now registered to our platform.",
      );
    });
  }
}

import 'package:get/get_utils/get_utils.dart';

import '../../../../data/AuthData.dart';
import '../../../models/ApiResponse.dart';
import 'AuthStateService.dart';

class MockAuthStateService implements AuthStateService {
  /// Start the server request
  void init(String client) => null;

  /// Stop the server request
  void close(String client) => null;

  @override
  Future<ApiResponse> getUser() async {
    return await 300.milliseconds.delay(() => AuthData.getUserSuccess);
  }

  @override
  Future<ApiResponse> logout() async {
    return await 300.milliseconds.delay(() => AuthData.logoutSuccess);
  }
}

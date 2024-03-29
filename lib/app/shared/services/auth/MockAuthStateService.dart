import 'package:get/get_utils/get_utils.dart';

import '../../../../data/AuthData.dart';
import '../../../models/ApiResponse.dart';
import '../Services.dart';

class MockAuthStateService extends BaseService implements AuthStateService {
  @override
  Future<ApiResponse> getUser() async {
    return await 300.milliseconds.delay(() => AuthData.getUserSuccess);
  }

  @override
  Future<ApiResponse> logout() async {
    return await 300.milliseconds.delay(() => AuthData.logoutSuccess);
  }
}

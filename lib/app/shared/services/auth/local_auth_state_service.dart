import 'package:get/get_utils/get_utils.dart';

import '../../../../data/AuthData.dart';
import '../../../models/api_response.dart';
import '../services.dart';

class LocalAuthStateService extends BaseService implements AuthStateService {
  @override
  Future<ApiResponse> getUser() async {
    return await 300.milliseconds.delay(() => AuthData.getUserSuccess);
  }

  @override
  Future<ApiResponse> logout() async {
    return await 300.milliseconds.delay(() => AuthData.logoutSuccess);
  }
}

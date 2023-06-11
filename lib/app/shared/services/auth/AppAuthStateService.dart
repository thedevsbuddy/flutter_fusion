import 'package:flutter_fusion/app/models/ApiResponse.dart';

import '../../../helpers/Global.dart';
import '../../../helpers/Request.dart';
import '../Services.dart';

class AppAuthStateService extends BaseService implements AuthStateService {
  late Request _request;
  AppAuthStateService() {
    _request = new Request();
  }

  @override
  Future<ApiResponse> getUser() async {
    if (storage.read("token") != null) {
      return await _request.get('/profile', client: 'getUser', authenticate: true);
    } else {
      return ApiResponse(status: "0", message: "Something went wrong");
    }
  }

  @override
  Future<ApiResponse> logout() async {
    return await _request.get('/logout', client: 'logout', authenticate: true);
  }
}

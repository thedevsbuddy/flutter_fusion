import 'package:flutter_mvc/app/models/ApiResponse.dart';

import '../../../helpers/Global.dart';
import '../../../helpers/Request.dart';
import 'AuthService.dart';

class AppAuthService implements AuthService {
  @override
  Future<ApiResponse> getUser() async {
    if (storage.read("token") != null) {
      return await Request.get('/profile', authenticate: true);
    } else {
      return ApiResponse(status: "0", message: "Something went wrong");
    }
  }

  @override
  Future<ApiResponse> logout() async {
    return await Request.get('/logout', authenticate: true);
  }
}

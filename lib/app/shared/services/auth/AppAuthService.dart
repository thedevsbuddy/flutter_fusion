import 'package:flutter_mvc/app/models/ApiResponse.dart';

import '../../../helpers/Global.dart';
import '../../../helpers/requests/Request.dart';
import 'AuthService.dart';

class AppAuthService implements AuthService {
  final Request request = Request.instance;

  @override
  Future<ApiResponse> getUser() async {
    if (storage.read("token") != null) {
      return await request.get('/profile', authenticate: true);
    } else {
      return ApiResponse(status: "error", message: "Something went wrong.");
    }
  }

  @override
  Future<ApiResponse> logout() async {
    return await request.get('/logout', authenticate: true);
  }
}

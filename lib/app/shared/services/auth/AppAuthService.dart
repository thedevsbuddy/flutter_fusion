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
  Future<ApiResponse> login({required String identifier, required String password}) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> register({required Map<String, dynamic> body}) async {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  void logout() {
    // TODO: implement logout
  }
}

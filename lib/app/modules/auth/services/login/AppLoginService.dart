import 'package:flutter_mvc/app/models/ApiResponse.dart';

import 'LoginService.dart';

class AppLoginService implements LoginService {
  @override
  Future<ApiResponse> login({required String identifier, required String password}) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> googleLogin() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}

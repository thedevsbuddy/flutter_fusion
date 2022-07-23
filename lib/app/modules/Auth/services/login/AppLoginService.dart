import 'package:flutter_mvc/app/models/ApiResponse.dart';

import 'LoginService.dart';

class AppLoginService implements LoginService {
  @override
  Future<ApiResponse> submit({required Map<String, dynamic> body}) async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> google() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}

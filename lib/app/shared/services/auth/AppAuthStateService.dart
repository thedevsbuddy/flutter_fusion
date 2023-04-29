import 'package:flutter_fusion/app/models/ApiResponse.dart';

import '../../../helpers/Global.dart';
import '../../../helpers/Request.dart';
import 'AuthStateService.dart';

class AppAuthStateService implements AuthStateService {
  late Request _request;
  AppAuthStateService() {
    _request = new Request();
  }

  /// Start the server request
  @override
  void init(String client) => _request.start(client);

  /// Stop the server request
  @override
  void close(String client) => _request.close(client);

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

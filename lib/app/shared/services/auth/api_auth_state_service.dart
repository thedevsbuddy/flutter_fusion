import '../../../helpers/global.dart';
import '../../../helpers/request.dart';
import '../../../models/api_response.dart';
import '../services.dart';

class ApiAuthStateService extends BaseService implements AuthStateService {
  late Request _request;
  ApiAuthStateService() {
    _request = Request();
  }

  @override
  Future<ApiResponse> getUser() async {
    if (storage.read("token") != null) {
      return await _request.get('/profile',
          client: 'getUser', authenticate: true);
    } else {
      return ApiResponse(status: "0", message: "Something went wrong");
    }
  }

  @override
  Future<ApiResponse> logout() async {
    return await _request.get('/logout', client: 'logout', authenticate: true);
  }
}

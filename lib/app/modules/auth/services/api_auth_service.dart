import '../../../helpers/request.dart';
import '../../../models/api_response.dart';
import 'auth_service.dart';

class ApiAuthService implements AuthService {
  late Request _request;
  ApiAuthService() {
    _request = new Request();
  }

  /// Start the server request
  @override
  void init(String client) => _request.start(client);

  /// Stop the server request
  @override
  void close(String client) => _request.close(client);

  @override
  Future<ApiResponse> login(
      {required String client, required Map<String, dynamic> body}) async {
    return await _request.post('/login', client: client, body: body);
  }

  @override
  Future<ApiResponse> register(
      {required String client, required Map<String, dynamic> body}) async {
    return await _request.post('/register', client: client, body: body);
  }

  @override
  Future<ApiResponse> google({required String client}) {
    // TODO: implement google
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> facebook({required String client}) {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> github({required String client}) {
    // TODO: implement github
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> verifyOtp(
      {required String client, required Map<String, dynamic> body}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}

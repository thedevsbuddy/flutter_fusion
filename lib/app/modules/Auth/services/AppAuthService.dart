import '../../../helpers/Request.dart';
import '../../../models/ApiResponse.dart';
import 'AuthService.dart';

class AppAuthService implements AuthService {
  late Request _request;
  AppAuthService() {
    _request = new Request();
  }

  /// Start the server request
  @override
  void init(String client) => _request.start(client);

  /// Stop the server request
  @override
  void close(String client) => _request.close(client);

  @override
  Future<ApiResponse> login({required Map<String, dynamic> body}) async {
    return await _request.post('/login', client: 'login', body: body);
  }

  @override
  Future<ApiResponse> register({required Map<String, dynamic> body}) async {
    return await _request.post('/register', client: 'register', body: body);
  }

  @override
  Future<ApiResponse> google() {
    // TODO: implement google
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> facebook() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> github() {
    // TODO: implement github
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> verifyOtp({required Map<String, dynamic> body}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}

import '../../../helpers/Request.dart';
import '../../../models/ApiResponse.dart';
import 'AuthService.dart';

class AppAuthService implements AuthService {
  /// Start the server request
  @override
  void init() => Request.start();

  /// Stop the server request
  @override
  void close() => Request.close();

  @override
  Future<ApiResponse> login({required Map<String, dynamic> body}) async {
    return await Request.post('/login', body: body);
  }

  @override
  Future<ApiResponse> register({required Map<String, dynamic> body}) async {
    return await Request.post('/register', body: body);
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

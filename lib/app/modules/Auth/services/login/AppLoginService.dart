import '../../../../helpers/requests/Request.dart';
import '../../../../models/ApiResponse.dart';
import 'LoginService.dart';

class AppLoginService implements LoginService {
  final Request request = Request.instance;

  @override
  Future<ApiResponse> submit({required Map<String, dynamic> body}) async {
    return await request.get('/login');
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
}

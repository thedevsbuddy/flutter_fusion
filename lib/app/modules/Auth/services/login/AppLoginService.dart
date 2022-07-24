
import '../../../../helpers/Request.dart';
import '../../../../models/ApiResponse.dart';
import 'LoginService.dart';

class AppLoginService implements LoginService{
  @override
  Future<ApiResponse> submit({required Map<String, dynamic> body}) async {
    return await Request.post('/login', body: body);
  }

  @override
  Future<ApiResponse> google() {
    // TODO: implement google
    throw UnimplementedError();
  }
}

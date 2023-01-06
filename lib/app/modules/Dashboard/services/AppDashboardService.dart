import '../../../helpers/Request.dart';
import '../../../models/ApiResponse.dart';
import 'DashboardService.dart';

class AppDashboardService implements DashboardService {
  /// Start the server request
  @override
  void init() => Request.start();

  /// Stop the server request
  @override
  void close() => Request.close();

  @override
  Future<ApiResponse> doSomething() async {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}

import '../../../models/ApiResponse.dart';
import 'DashboardService.dart';

class MockDashboardService implements DashboardService {
  /// Start the server request
  @override
  void init() => null;

  /// Stop the server request
  @override
  void close() => null;

  @override
  Future<ApiResponse> doSomething() async {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}

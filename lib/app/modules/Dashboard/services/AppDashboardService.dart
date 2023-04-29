import '../../../helpers/Request.dart';
import '../../../models/ApiResponse.dart';
import 'DashboardService.dart';

class AppDashboardService implements DashboardService {
  late Request _request;
  AppDashboardService() {
    _request = new Request();
  }

  /// Start the server request
  @override
  void init(String client) => _request.start(client);

  /// Stop the server request
  @override
  void close(String client) => _request.close(client);

  @override
  Future<ApiResponse> doSomething() async {
    throw UnimplementedError();
  }
}

import '../../../models/ApiResponse.dart';
import '../../../shared/services/Services.dart';
import 'DashboardService.dart';

class MockDashboardService extends BaseService implements DashboardService {
  @override
  Future<ApiResponse> doSomething({required String client}) async {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}

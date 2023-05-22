import '../../../models/ApiResponse.dart';
import '../../../shared/services/Services.dart';
import 'DashboardService.dart';

class AppDashboardService extends BaseService implements DashboardService {
  @override
  bool withPagination = true;

  @override
  Future<ApiResponse> doSomething({required String client}) async {
    return await api.get('/url', client: client);
  }
}

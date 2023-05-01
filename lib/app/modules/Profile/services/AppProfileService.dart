import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import 'ProfileService.dart';

class AppProfileService implements ProfileService {
  late Request _request;
  AppProfileService() {
    _request = new Request();
  }

  /// Start the server request
  @override
  void init(String client) => _request.start(client);

  /// Stop the server request
  @override
  void close(String client) => _request.close(client);

  @override
  Future<ApiResponse> getData() async {
    return await _request.get('/todos', client: "getData");
  }
}

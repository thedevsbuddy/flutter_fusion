import '../../../models/api_response.dart';
import '../../../helpers/request.dart';
import 'profile_service.dart';

class ApiProfileService implements ProfileService {
  late Request _request;
  ApiProfileService() {
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
    throw UnimplementedError('Add this method');
  }
}

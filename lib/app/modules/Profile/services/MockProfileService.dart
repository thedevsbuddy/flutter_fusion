import '../../../models/ApiResponse.dart';
import 'ProfileService.dart';
 
class MockProfileService implements ProfileService {
  /// Start the server request
  @override
  void init(String client) => null;

  /// Stop the server request
  @override
  void close(String client) => null;
  
  @override
  Future<ApiResponse> getData() async {
    throw UnimplementedError();
  }
}


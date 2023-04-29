const String stub = """
import '../../../models/ApiResponse.dart';
import '{MODULE}Service.dart';
 
class Mock{MODULE}Service implements {MODULE}Service {
  /// Start the server request
  @override
  void init(String client) => null;

  /// Stop the server request
  @override
  void close(String client) => null;
  
  @override
  Future<ApiResponse> doSomething() async {
    throw UnimplementedError();
  }
}
""";

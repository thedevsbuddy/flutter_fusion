const String stub = """
import '../../../models/ApiResponse.dart';
import '{MODULE}Service.dart';

class Mock{MODULE}Service implements {MODULE}Service {
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
""";

const String stub = """
import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import '{MODULE}Service.dart';

class App{MODULE}Service implements {MODULE}Service {
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
""";

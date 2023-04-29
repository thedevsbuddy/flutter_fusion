const String stub = """
import '../../../models/ApiResponse.dart';
import '../../../helpers/Request.dart';
import '{MODULE}Service.dart';

class App{MODULE}Service implements {MODULE}Service {
  late Request _request;
  AppAuthService() {
    _request = new Request();
  }

  /// Start the server request
  @override
  void init(String client) => Request.start(client);

  /// Stop the server request
  @override
  void close(String client) => Request.close(client);
  
  @override
  Future<ApiResponse> doSomething() async {
    throw UnimplementedError();
  }
}
""";

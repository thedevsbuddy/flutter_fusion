const String stub = """
import '../../../models/ApiResponse.dart';
import '{MODULE}Service.dart';

class App{MODULE}Service implements {MODULE}Service {
  @override
  Future<ApiResponse> doSomething() async {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }
}
""";

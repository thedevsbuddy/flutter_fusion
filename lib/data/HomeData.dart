import '../app/models/ApiResponse.dart';

class HomeData {
  /// Login Responses
  static ApiResponse get slider => ApiResponse(
        status: "success",
        message: "Action was successful.",
        data: {},
      );
}

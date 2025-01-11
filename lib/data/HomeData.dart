import '../app/models/api_response.dart';

class HomeData {
  /// Login Responses
  static ApiResponse get slider => ApiResponse(
        status: "success",
        message: "Action was successful.",
        data: {},
      );
}

import 'package:get/get_utils/get_utils.dart';

import '../../../../models/ApiResponse.dart';
import 'RegisterService.dart';

class MockRegisterService implements RegisterService {
  @override
  Future<ApiResponse> submit({required Map<String, dynamic> body}) async {
    return await Future.delayed(2.seconds, () {
      return ApiResponse(
        status: "success",
        message: "Logged in successfully.",
        data: {
          "user": {
            "id": 1,
            "name": "Shoaib Khan",
            "email": "shoabkhan33@gmail.com",
            "phone": "9589988584",
            "avatar":
                "https://pps.whatsapp.net/v/t61.24694-24/247423709_397437045296762_3315062361878079338_n.jpg?stp=dst-jpg_s96x96&ccb=11-4&oh=01_AVxRQ2LQTzgvNk6GhdLyfHjVJeilNQb3mXsVgCgBBfCdHQ&oe=62BEB9F1",
            "gender": "male"
          },
          "token": "some_random_string_as_token"
        },
      );
    });
  }
}

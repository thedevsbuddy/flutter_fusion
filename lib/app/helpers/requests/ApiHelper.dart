import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui_x/ui_x.dart';

import '../../../config/Config.dart';
import '../../models/ApiResponse.dart';
import '../Global.dart';

mixin ApiHelper {
  int timeOutDuration = 30; // [ In Seconds ]
  http.Client httpClient = http.Client();

  ///======================================
  /// Prepare Header for requests
  ///
  /// @var bool token = true
  ///======================================
  Map<String, String> getHeaders({bool token = true, Map<String, String>? userHeaders}) {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
    };

    if (token) {
      var _token = storage.read('token');
      headers = {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $_token",
      };
    }
    if (userHeaders != null) headers.assignAll(userHeaders);

    return headers;
  }

  ///======================
  /// Process the Response
  ///======================
  dynamic processResponse(http.Response response) {
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    httpClient.close();
    switch (response.statusCode) {
      case 200:
        return body;
      case 201:
        return body;
      case 400:
        return body;
      case 401:
      case 403:
        Toastr.show(message: "You are logged out!");
        auth.logout();
        return;
      case 422:
        return body;
      case 500:
      default:
        return body;
    }
  }

  ///======================
  /// Sanitize the API uri
  ///======================
  dynamic sanitizedUri(String uri, Map<String, dynamic>? params) {
    if (uri[0] != "/") {
      uri = "/$uri${handleParams(params)}";
    } else {
      uri = "$uri${handleParams(params)}";
    }
    return Uri.parse("${Config.apiBaseUrl}$uri");
  }

  ///======================
  /// Parse the url parameters
  ///======================
  String handleParams(Map<String, dynamic>? params) {
    String _params = '';

    params?.keys.forEach((key) {
      if (params.keys.first == key) {
        _params += "?$key=${params[key]}";
      } else {
        _params += "&$key=${params[key]}";
      }
    });
    return _params;
  }
}

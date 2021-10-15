import 'dart:async';
import 'dart:convert';
import 'package:basic_ui/basic_ui.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../views/views.dart';
import 'Global.dart';

class Request {
  static const int TIME_OUT_DURATION = 20;

  ///====================
  /// GET Request
  ///====================
  static Future<dynamic> get(Uri url, {bool authenticate = false}) async {
    var response = await http
        .get(url, headers: _getHeaders(token: authenticate))
        .timeout(Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  }

  ///====================
  /// POST Request
  ///====================
  static Future<dynamic> post(Uri url,
      {dynamic body, bool authenticate = false}) async {
    var payload = json.encode(body);
    var response = await http
        .post(url, body: payload, headers: _getHeaders(token: authenticate))
        .timeout(Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  }

  ///====================
  /// PUT Request
  ///====================
  static Future<dynamic> put(Uri url,
      {dynamic body, bool authenticate = false}) async {
    var payload = json.encode(body);
    var response = await http
        .put(url, body: payload, headers: _getHeaders(token: authenticate))
        .timeout(Duration(seconds: TIME_OUT_DURATION));

    return _processResponse(response);
  }

  ///====================
  /// DELETE Request
  ///====================
  static Future<dynamic> delete(Uri url,
      {dynamic body, bool authenticate = false}) async {
    var payload = json.encode(body);
    var response = await http
        .delete(url, body: payload, headers: _getHeaders(token: authenticate))
        .timeout(Duration(seconds: TIME_OUT_DURATION));

    return _processResponse(response);
  }

  ///======================================
  /// Prepare Header for requests
  ///
  /// @var bool token = true
  ///======================================
  static Map<String, String> _getHeaders({bool token = true}) {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
    };

    if (token) {
      var _token = storage.read('auth_token');
      headers = {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $_token"
      };
    }
    return headers;
  }

  ///======================
  /// Process the Response
  ///======================
  static dynamic _processResponse(http.Response response) {
    var body = jsonDecode(response.body);
    switch (response.statusCode) {
      case 200:
        return body;
      case 201:
        return body;
      case 400:
        Get.to(() => ServerErrorPage(message: "Something went wrong!"),
            transition: Transition.fade);
        break;
      case 401:
      case 403:
        ShowSnack.toast(message: "You are logged out!");
        auth.logout();
        break;
      case 422:
        Get.to(() => ServerErrorPage(message: body['Message']),
            transition: Transition.fade);
        break;
      case 500:
      default:
        Get.to(() => ServerErrorPage(message: body['Message']),
            transition: Transition.fade);
        break;
    }
  }
}

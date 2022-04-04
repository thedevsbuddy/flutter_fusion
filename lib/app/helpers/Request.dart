import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:basic_ui/basic_ui.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../config/Config.dart';
import '../models/ApiResponse.dart';
import '../views/views.dart';
import 'Global.dart';

class Request {
  static const int TIME_OUT_DURATION = 20;

  ///====================
  /// GET Request
  ///====================
  static Future<dynamic> get(String url, {Map<String, dynamic>? params, Map<String, String>? headers, bool authenticate = false}) async {
    log.w(_getHeaders(token: authenticate, userHeaders: headers));
    var response = await http.get(_sanitizedUri(url, params), headers: _getHeaders(token: authenticate, userHeaders: headers)).timeout(Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  }

  ///====================
  /// POST Request
  ///====================
  static Future<dynamic> post(String url, {Map<String, dynamic>? params, Map<String, String>? headers, dynamic body, bool authenticate = false}) async {
    var payload = json.encode(body);
    var response = await http.post(_sanitizedUri(url, params), body: payload, headers: _getHeaders(token: authenticate, userHeaders: headers)).timeout(Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  }

  ///====================
  /// MULTIPART Request
  ///====================
  static Future<dynamic> multipart(String url, {required String method, Map<String, dynamic>? params, Map<String, String>? headers, required Map<String, dynamic> body, bool authenticate = false}) async {
    assert(body.containsKey('files'));
    assert(method.toUpperCase() == "POST" || method.toUpperCase() == "PUT");
    var request = http.MultipartRequest(method, _sanitizedUri(url, params));

    var fileMap = body['files'];

    fileMap.keys.forEach((key) async {
      if (fileMap.keys[key] is List<File>) {
        // TODO: Handle multiple files
      } else if (fileMap.keys[key] is File) {
        request.files.add(await http.MultipartFile.fromPath('$key', fileMap.keys[key].path));
      }
    });

    body.keys.forEach((key) {
      if (key != 'files') {
        request.fields['$key'] = body[key];
      }
    });

    log.w(request.fields.toString());
    log.i(request.files.toString());
    return;

    var payload = json.encode(body);
    var response = http.Response.fromStream(await request.send());
    // var response = await http.post(_sanitizedUri(url, params), body: payload, headers: _getHeaders(token: authenticate)).timeout(Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  }

  ///====================
  /// PUT Request
  ///====================
  static Future<dynamic> put(String url, {Map<String, dynamic>? params, Map<String, String>? headers, dynamic body, bool authenticate = false}) async {
    var payload = json.encode(body);
    var response = await http.put(_sanitizedUri(url, params), body: payload, headers: _getHeaders(token: authenticate, userHeaders: headers)).timeout(Duration(seconds: TIME_OUT_DURATION));

    return _processResponse(response);
  }

  ///====================
  /// DELETE Request
  ///====================
  static Future<dynamic> delete(String url, {Map<String, dynamic>? params, Map<String, String>? headers, dynamic body, bool authenticate = false}) async {
    var payload = json.encode(body);
    var response = await http.delete(_sanitizedUri(url, params), body: payload, headers: _getHeaders(token: authenticate, userHeaders: headers)).timeout(Duration(seconds: TIME_OUT_DURATION));

    return _processResponse(response);
  }

  ///======================================
  /// Prepare Header for requests
  ///
  /// @var bool token = true
  ///======================================
  static Map<String, String> _getHeaders({bool token = true, Map<String, String>? userHeaders}) {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-type": "application/json",
    };

    if (token) {
      var _token = storage.read('token');
      headers = {"Content-type": "application/json", "Accept": "application/json", "Authorization": "Bearer $_token"};
    }
    headers.assignAll(userHeaders!);

    return headers;
  }

  ///======================
  /// Process the Response
  ///======================
  static dynamic _processResponse(http.Response response) {
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    switch (response.statusCode) {
      case 200:
        return body;
      case 201:
        return body;
      case 400:
        Get.to(() => ServerErrorPage(message: "Something went wrong!"), transition: Transition.fade);
        break;
      case 401:
      case 403:
        ShowSnack.toast(message: "You are logged out!");
        auth.logout();
        break;
      case 422:
        Get.to(() => ServerErrorPage(message: "${body.message}"), transition: Transition.fade);
        break;
      case 500:
      default:
        Get.to(() => ServerErrorPage(message: "${body.message}"), transition: Transition.fade);
        break;
    }
  }

  ///======================
  /// Sanitize the API uri
  ///======================
  static dynamic _sanitizedUri(String uri, Map<String, dynamic>? params) {
    if (uri.toString()[0] != "/") {
      uri = "/$uri${_handleParams(params)}";
    } else {
      uri = "$uri${_handleParams(params)}";
    }
    return Uri.parse("${Config.apiBaseUrl}$uri");
  }

  ///======================
  /// Sanitize the API uri
  ///======================
  static String _handleParams(Map<String, dynamic>? params) {
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

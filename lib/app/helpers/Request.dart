import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ui_x/ui_x.dart';

import '../../config/Config.dart';
import '../models/ApiResponse.dart';
import 'Global.dart';

class Request {
  static const int TIME_OUT_DURATION = 30; // [ In Seconds ]

  final List<HttpClient> _clients = [];

  void start(String client) {
    _clients.add(HttpClient(id: client, client: http.Client()));
  }

  void close(String client) {
    HttpClient _client = _clients.firstWhere((element) => element.id == client);

    _client.client.close();

    _clients.add(HttpClient(id: client, client: http.Client()));
  }

  ///====================
  /// GET Request
  ///====================
  Future<dynamic> get(String url, {required String client, Map<String, dynamic>? params, Map<String, String>? headers, bool authenticate = false}) async {
    HttpClient _httpClient = _clients.firstWhere((element) => element.id == client);
    http.Response response =
        await _httpClient.client.get(_sanitizedUri(url, params), headers: _getHeaders(token: authenticate, userHeaders: headers)).timeout(Duration(seconds: TIME_OUT_DURATION));
    return _processResponse(response);
  }

  ///====================
  /// POST Request
  ///====================
  Future<dynamic> post(String url, {required String client, Map<String, dynamic>? params, Map<String, String>? headers, dynamic body, bool authenticate = false}) async {
    HttpClient _httpClient = _clients.firstWhere((element) => element.id == client);
    String payload = json.encode(body);
    http.Response response = await _httpClient.client
        .post(_sanitizedUri(url, params), body: payload, headers: _getHeaders(token: authenticate, userHeaders: headers))
        .timeout(Duration(seconds: TIME_OUT_DURATION));

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
  static dynamic _processResponse(http.Response response) {
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
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
  static dynamic _sanitizedUri(String uri, Map<String, dynamic>? params) {
    if (uri[0] != "/") {
      uri = "/$uri${_handleParams(params)}";
    } else {
      uri = "$uri${_handleParams(params)}";
    }
    return Uri.parse("${Config.apiBaseUrl}$uri");
  }

  ///======================
  /// Parse the url parameters
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

/// HttpClient Class Model
class HttpClient {
  HttpClient({
    required this.id,
    required this.client,
  });

  String id;
  http.Client client;
}

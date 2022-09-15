import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../models/ApiResponse.dart';
import 'ApiHelper.dart';
import 'Request.dart';

class ApiRequest with ApiHelper implements Request {
  ///====================
  /// GET Request
  ///
  ///====================
  @override
  Future<ApiResponse> get(String url,
      {Map<String, dynamic>? params, Map<String, String>? headers, bool authenticate = false}) async {
    http.Response response = await httpClient
        .get(sanitizedUri(url, params), headers: getHeaders(token: authenticate, userHeaders: headers))
        .timeout(Duration(seconds: timeOutDuration));
    return processResponse(response);
  }

  ///====================
  /// POST Request
  ///
  ///====================
  @override
  Future<ApiResponse> post(String url,
      {Map<String, dynamic>? params, Map<String, String>? headers, dynamic body, bool authenticate = false}) async {
    String payload = json.encode(body);
    http.Response response = await httpClient
        .post(sanitizedUri(url, params), body: payload, headers: getHeaders(token: authenticate, userHeaders: headers))
        .timeout(Duration(seconds: timeOutDuration));
    return processResponse(response);
  }

  ///====================
  /// MULTIPART Request
  ///
  ///====================
  @override
  Future<ApiResponse> multipart(String url,
      {String method = 'POST',
      required Map<String, dynamic> body,
      Map<String, dynamic>? params,
      Map<String, String>? headers,
      bool authenticate = false}) async {
    assert(body.containsKey('files'));
    assert(body['files'] != null);
    assert(body['files'] is Map<String, File> || body['files'] is Map<String, List<File>>);
    assert(method.toUpperCase() == "POST" || method.toUpperCase() == "PUT");
    http.MultipartRequest request = http.MultipartRequest("$method", sanitizedUri(url, params));

    body.keys.forEach((key) {
      if (key != 'files') {
        request.fields['$key'] = body["$key"];
      }
    });

    Map<String, dynamic> fileMap = body['files'];

    fileMap.keys.forEach((key) async {
      if (fileMap["$key"] is List<File>) {
        for (File _file in fileMap["$key"]) {
          request.files.add(await http.MultipartFile.fromPath(key + "[]", _file.path));
        }
      } else if (fileMap["$key"] is File) {
        request.files.add(await http.MultipartFile.fromPath("$key", fileMap["$key"].path));
      }
    });

    /// Set Headers
    request.headers.addAll(getHeaders(token: authenticate));

    http.Response response = await http.Response.fromStream(await httpClient.send(request));
    return processResponse(response);
  }

  ///====================
  /// PUT Request
  ///
  ///====================
  @override
  Future<ApiResponse> put(String url,
      {Map<String, dynamic>? params, Map<String, String>? headers, dynamic body, bool authenticate = false}) async {
    String payload = json.encode(body);
    http.Response response = await httpClient
        .put(sanitizedUri(url, params), body: payload, headers: getHeaders(token: authenticate, userHeaders: headers))
        .timeout(Duration(seconds: timeOutDuration));

    return processResponse(response);
  }

  ///====================
  /// DELETE Request
  ///
  ///====================
  @override
  Future<ApiResponse> delete(String url,
      {Map<String, dynamic>? params, Map<String, String>? headers, dynamic body, bool authenticate = false}) async {
    String payload = json.encode(body);
    http.Response response = await httpClient
        .delete(sanitizedUri(url, params), body: payload, headers: getHeaders(token: authenticate, userHeaders: headers))
        .timeout(Duration(seconds: timeOutDuration));

    return processResponse(response);
  }

  ///====================
  /// DOWNLOAD [File] Request
  ///
  ///====================
  @override
  Future<File> download(String url, {String? fileName, bool authenticate = false}) async {
    http.Response response = await httpClient
        .get(sanitizedUri(url, {}), headers: getHeaders(token: authenticate, userHeaders: {}))
        .timeout(Duration(seconds: timeOutDuration));

    String _dir = (await getApplicationDocumentsDirectory()).path;
    File _file = new File('$_dir/$fileName');
    await _file.writeAsBytes(response.bodyBytes);
    return _file;
  }
}

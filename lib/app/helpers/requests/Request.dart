import 'dart:io';

import 'package:get/get.dart';

import '../../models/ApiResponse.dart';
import 'ApiRequest.dart';
import 'MockRequest.dart';

abstract class Request {
  static const MOCK_ENABLED = false;

  static Request get instance {
    if (!Get.isRegistered<Request>()) Get.put(MOCK_ENABLED ? MockRequest() : ApiRequest());
    return Get.find<Request>();
  }

  /// Get Request
  Future<ApiResponse> get(String url, {Map<String, dynamic>? params, Map<String, String>? headers, bool authenticate = false});

  /// Post Request
  Future<ApiResponse> post(String url,
      {Map<String, dynamic>? params,
      Map<String, String>? headers,
      required Map<String, dynamic> body,
      bool authenticate = false});

  /// PUT Request
  Future<ApiResponse> put(String url,
      {Map<String, dynamic>? params,
      Map<String, String>? headers,
      required Map<String, dynamic> body,
      bool authenticate = false});

  /// DELETE Request
  Future<ApiResponse> delete(String url,
      {Map<String, dynamic>? params, Map<String, String>? headers, Map<String, dynamic>? body, bool authenticate = false});

  /// DOWNLOAD Request to download file(s)
  Future<File> download(String url, {String? fileName, bool authenticate = false});

  /// Multipart Request to upload files
  Future<ApiResponse> multipart(String url,
      {String method = 'POST',
      required Map<String, dynamic> body,
      Map<String, dynamic>? params,
      Map<String, String>? headers,
      bool authenticate = false});
}

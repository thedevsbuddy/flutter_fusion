import 'dart:io';

import '../../models/ApiResponse.dart';
import 'Request.dart';

class MockRequest implements Request {
  @override
  Future<ApiResponse> get(String url, {Map<String, dynamic>? params, Map<String, String>? headers, bool authenticate = false}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> post(String url,
      {Map<String, dynamic>? params,
      Map<String, String>? headers,
      required Map<String, dynamic> body,
      bool authenticate = false}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> put(String url,
      {Map<String, dynamic>? params,
      Map<String, String>? headers,
      required Map<String, dynamic> body,
      bool authenticate = false}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> delete(String url,
      {Map<String, dynamic>? params, Map<String, String>? headers, Map<String, dynamic>? body, bool authenticate = false}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<File> download(String url, {String? fileName, bool authenticate = false}) {
    // TODO: implement download
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> multipart(String url,
      {String method = 'POST',
      required Map<String, dynamic> body,
      Map<String, dynamic>? params,
      Map<String, String>? headers,
      bool authenticate = false}) {
    // TODO: implement multipart
    throw UnimplementedError();
  }
}

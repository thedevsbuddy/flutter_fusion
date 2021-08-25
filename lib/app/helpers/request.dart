import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../exceptions/app_exception.dart';

class Request {
  static const int TIME_OUT_DURATION = 20;
  //GET
  static Future<dynamic> get(Uri url) async {
    try {
      var response =
          await http.get(url).timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  //POST
  static Future<dynamic> post(Uri url, {dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await http
          .post(url, body: payload)
          .timeout(Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', url.toString());
    }
  }

  //DELETE
  //OTHER

  static dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}

import 'dart:convert';

ApiResponse apiResponseModelFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseModelToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data,
      };

  bool isOk() => status == 'success';
  bool isSuccessful() => status == 'success';
  bool hasError() => status == 'error';
  bool hasData() {
    if (data == null) {
      return false;
    } else if (data is List) {
      if (data.length > 0) return true;
    } else if (data is Map) {
      if (data.length > 0) return true;
    }

    return false;
  }
}

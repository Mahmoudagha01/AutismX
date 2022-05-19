import 'dart:convert';

class ApiResponse<T> {
  bool success;
  String message;
  T data;

  ApiResponse.fromJson(Map<String, dynamic> json)
      : success =
            json['success'] == "true", //TODO: Change this to boolean from api
        message = json['message'],
        data = json['data'];

  ApiResponse.fromJsonString(String json) : this.fromJson(jsonDecode(json));
}

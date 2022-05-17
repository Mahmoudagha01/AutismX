import 'package:autismx/shared/network/dio/api_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://autismx.net/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response<Map<String, dynamic>>> postData({
    @required String url,
    dynamic data,
    String token,
    Map<String, dynamic> query,
  }) async {
    if (token != null) {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
    }

    return dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response<Map<String, dynamic>>> get({
    @required String url,
    String token,
    Map<String, dynamic> query,
  }) async {
    if (token != null) {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
      };
    }
    return dio.get(
      url,
      queryParameters: query,
    );
  }
}

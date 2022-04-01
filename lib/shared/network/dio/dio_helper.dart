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

  

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
    String token,
  }) async {
     dio.options.headers =
    {
      
      'Authorization': token,
    };
    return dio.post(
      url,
      data: data,
      
      
    );
    
  }
}

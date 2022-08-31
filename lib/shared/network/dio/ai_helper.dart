import 'dart:io';

import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AIDioHelper {
  static Future<Response<Map<String, dynamic>>> uploadImage({
    @required File imageFile,
  }) async {
    //TODO change url
    return await DioHelper.postData(
        url: "https://f305-41-33-235-109.eu.ngrok.io/upload_image",
        data: FormData.fromMap({
          "file": await MultipartFile.fromFile(imageFile.path,
              filename: imageFile.path.split('/').last)
        })).then(
      (response) {
        return response;
      },
    );
  }
}
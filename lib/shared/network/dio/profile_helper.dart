import 'dart:io';

import 'package:autismx/shared/models/signinmodel.dart';
import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:autismx/shared/network/end_point.dart' as endpoints;

class ProfileDioHelper {
  static Future<Response<Map<String, dynamic>>> register({
    @required String firstName,
    @required String lastName,
    @required String address,
    @required String phone,
    @required String email,
    @required String password,
    @required String childName,
    @required int childAge,
    @required int childGender,
    @required File childImageFile,
  }) async {
    return await DioHelper.postData(
      url: endpoints.register,
      data: FormData.fromMap(
        {
          "firstName": firstName,
          "secondName": lastName,
          "phone": phone,
          "address": address,
          "email": email,
          "password": password,
          "child_name": childName,
          "child_age": childAge,
          "child_gender": childGender,
          "child_image": await MultipartFile.fromFile(childImageFile.path,
              filename: childImageFile.path.split('/').last)
        },
      ),
    );
  }

  static Future<Response<Map<String, dynamic>>> signIn({
    @required String email,
    @required String password,
  }) async {
    return await DioHelper.postData(url: endpoints.login, data: {
      "email": email,
      "password": password,
    }).then(
      (response) {
        //Automatically save token for future usage
        if (response.statusCode == 200) {
          SigninModel model = SigninModel.fromJson(response.data);
          DioHelper.dio.options.headers = {
            'Authorization': "Bearer ${model.data.token}",
          };
        }

        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> logout() async {
    return await DioHelper.get(url: endpoints.logout).then(
      (response) {
        //Automatically delete saved token
        if (response.statusCode == 200) {
          DioHelper.dio.options.headers = {
            'Authorization': null,
          };
        }

        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> updateParentProfile({
    @required String firstName,
    @required String lastName,
    @required String address,
    @required String phone,
    @required String email,
    String password,
    @required String childName,
    @required int childAge,
    @required int childGender,
    File childImageFile,
  }) async {
    return await DioHelper.postData(
      url: endpoints.updateParentProfile,
      data: FormData.fromMap(
        {
          "firstName": firstName,
          "secondName": lastName,
          "phone": phone,
          "address": address,
          "email": email,
          "password": password,
          "child_name": childName,
          "child_age": childAge,
          "child_gender": childGender,
          "child_image": childImageFile != null
              ? await MultipartFile.fromFile(childImageFile.path,
                  filename: childImageFile.path.split('/').last)
              : null
        },
      ),
    );
  }
}

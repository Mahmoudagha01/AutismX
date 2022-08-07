import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:autismx/shared/network/end_point.dart' as endpoints;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ParentDioHelper {
  static Future<Response<Map<String, dynamic>>> showParentScore() async {
    return await DioHelper.get(url: endpoints.showParentScore).then(
      (response) {
        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> deleteParentScore(
      int id) async {
    return await DioHelper.get(
      url: endpoints.deleteParentScore + "/$id",
    ).then(
      (response) {
        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> showAdvices() async {
    return await DioHelper.get(url: endpoints.showAdvices).then(
      (response) {
        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> createFeedback({
    @required String feedback,
  }) async {
    return await DioHelper.postData(
      url: endpoints.createFeedback,
      data: {"feedback": feedback},
    ).then(
      (response) {
        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> postParentScore({
    @required int score,
    @required String advise,
    @required String childCase,
    @required String date,
    @required int childAge,
    @required int childGender,
  }) async {
    return await DioHelper.postData(
      url: endpoints.updateParentScore,
      data: {
        "score": score,
        "advise": advise,
        "case": childCase,
        "date": date,
        "age": childAge,
        "gender": childGender
      },
    ).then(
      (response) {
        return response;
      },
    );
  }
}
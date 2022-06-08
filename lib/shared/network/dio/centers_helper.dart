import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:autismx/shared/network/end_point.dart' as endpoints;
import 'package:dio/dio.dart';

class CentersDioHelper {
  static Future<Response<Map<String, dynamic>>> showAllCenters() async {
    return await DioHelper.get(url: endpoints.allCenters).then(
      (response) {
        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> getHighCenters() async {
    return await DioHelper.get(url: endpoints.highCenters).then(
      (response) {
        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> findCenterByAddress(
      String address) async {
    return await DioHelper.postData(
        url: endpoints.centerByAddress, query: {"address": address}).then(
      (response) {
        return response;
      },
    );
  }
}
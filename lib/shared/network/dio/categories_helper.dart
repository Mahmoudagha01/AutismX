import 'package:autismx/shared/network/dio/dio_helper.dart';
import 'package:autismx/shared/network/end_point.dart' as endpoints;
import 'package:dio/dio.dart';

class CategoriesDioHelper {
  static Future<Response<Map<String, dynamic>>> showAllCategories() async {
    return await DioHelper.get(url: endpoints.allCategories).then(
      (response) {
        return response;
      },
    );
  }

  static Future<Response<Map<String, dynamic>>> getCategoryDepartments(
      int category) async {
    return await DioHelper.postData(
            url: "${endpoints.departementOfCategory}/$category")
        .then(
      (response) {
        return response;
      },
    );
  }
}

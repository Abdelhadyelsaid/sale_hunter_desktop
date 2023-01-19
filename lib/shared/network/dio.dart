import 'package:dio/dio.dart';
class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://sale-hunter.herokuapp.com/api/v1/stores/87/products',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    String url,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Authorization': "Bearer ${token ?? ''}",
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
     String url,
     dynamic data,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Authorization': "Bearer ${token ?? ''}",
      'Content-Type': 'application/json',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> patchData({
    String url,
    dynamic data,
    Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers = {
      'Authorization': "Bearer ${token ?? ''}",
    };

    return dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
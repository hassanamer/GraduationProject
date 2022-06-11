import 'package:dio/dio.dart';

class DioHelper {

  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://egyptturism.herokuapp.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
    };

    return await dio!.get(
      url,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
    };
    return await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': token ?? '',
    };

    return await dio!.put(
      url,
      data: data,
    );
  }
}

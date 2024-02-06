import 'package:dio/dio.dart';

import 'constants.dart';

class DioConfig{
  static Dio getDio(){
    BaseOptions options=BaseOptions(baseUrl: baseUrl);
    Dio dio=Dio(options);
    dio.interceptors.add(LogInterceptor(requestBody: true));
    return dio;
  }
}

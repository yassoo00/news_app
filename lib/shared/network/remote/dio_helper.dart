import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio=Dio();

  static int()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String , dynamic> query,
  })async
  {
    return await dio.get('https://newsapi.org/$url',queryParameters: query);
  }
}
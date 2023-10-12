import 'package:dio/dio.dart';

class dioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://gnews.io/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
    {required String path, Map<String,dynamic>?query})async {
  return await  dio.get(path,
    queryParameters:query );
  }
}

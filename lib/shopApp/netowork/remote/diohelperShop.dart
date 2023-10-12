import 'package:dio/dio.dart';

class DioHelperShop {
  static late Dio dio;

  static init() {
   
    dio = Dio(BaseOptions(
      // for shop app
      baseUrl: 'https://fakestoreapi.com/',
      receiveDataWhenStatusError: true,
    ));
  }


 

  // for shop app

  static Future<Response> getData(
      {
        required String path,
        String?token
   
     }) async {
       Map<String, String> headers = {};
        if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    dio.options.headers = headers;
    return await dio.get(
      path,
   
    );
  }

  // static Future<Response> postData(
  //     {required String url,
  //     Map<String, dynamic>? query,
  //     required Map<String, dynamic> data,
  //     String lang = "en",
  //     String? token}) async {
  //   dio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'lang': lang,
  //     'Authorization': token ?? ''
  //   };
  //   return dio.post(url, queryParameters: query, data: data);
  // }

  // static Future<Response> putData(
  //     {required String url,
  //     Map<String, dynamic>? query,
  //     required Map<String, dynamic> data,
  //     String lang = "en",
  //     String? token}) async {
  //   dio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'lang': lang,
  //     'Authorization': token ?? ''
  //   };
  //   return dio.put(url, queryParameters: query, data: data);
  // }
}

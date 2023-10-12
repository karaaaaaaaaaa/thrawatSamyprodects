import 'package:dio/dio.dart';
// https://gnews.io/api/v4/top-headlines?country=eg&category=sport&apikey=b6c932ce4ff392f5b4bc0df9375766ec
class dioWeatherHelper {
  static late Dio dio;
  static init() {
    // 'https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=$cityname&aqi=no&alert=no'
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.weatherapi.com/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getdata(
    {required String path, Map<String,dynamic>?query})async {
  return await  dio.get(path,
    queryParameters:query );
  }
}

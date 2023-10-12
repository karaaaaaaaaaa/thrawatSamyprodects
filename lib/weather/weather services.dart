// ignore_for_file: unused_local_variable, null_check_always_fails

import 'package:app1/weather/model.dart';
import 'package:dio/dio.dart';

class weatherServices {
  final Dio dio;

  weatherServices(this.dio);
  Future<weatherModel> getweather({required String cityname}) async {
    try {
      Response response = await dio
      .get(
          'https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=$cityname&aqi=no&alert=no');
      weatherModel weathermodel = weatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (error) {
      
      final String Errorweather = error.response?.data['error']['message'] ??
          'opp there are an error ,try later';
           print(error.toString());
      throw Exception(Errorweather);
    } catch (error) {
      print(error.toString());
      throw Exception('opps  there was an error ');
    }
  }

  // Future<weatherModel> getweather() async {
  //   try {
  //     Response response = await dio.get(
  //         'https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=cario&aqi=no&alert=no');
  //     weatherModel weathermodel = weatherModel.fromJson(response.data);
  //     return weathermodel;
  //   } on DioError catch (error) {
  //     final String Errorweather = error.response?.data['error']['message'] ??
  //         'opp there are an error ,try later';
  //     throw Exception(Errorweather);

  //   }
  // }
}

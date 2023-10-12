// ignore_for_file: unused_local_variable, unused_import

import 'package:app1/weather/dio_helper.dart';
import 'package:app1/weather/model.dart';
import 'package:app1/weather/secoundmodel.dart';
import 'package:app1/weather/weather%20services.dart';
import 'package:app1/weather/weatherstate.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class weatherCubit extends Cubit<weatherStates> {
  weatherCubit() : super(initalState());
  static weatherCubit get(context) => BlocProvider.of(context);
  // 'https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=$cityname&aqi=no&alert=no'
  // weatherModel? weathermodel
  Secoundmodel? weathermodel;
  getweather({required String cityname}) async {
    emit(weatherloadingState());
    dioWeatherHelper.getdata(path: 'v1/forecast.json', query: {
      'key': 'cd321da97aac408f8fc125209231109',
      'q': '$cityname',
      'aqi': 'no',
      'alert': 'no'
    }).then((value) {
      weathermodel = Secoundmodel.formjson(value.data);
      // weathermodel = weatherModel.fromJson(value.data);
      print(weathermodel!.forecast.forecastday[0].day.condition.weathercondition);
      emit(getweatherState(weathermodel!));
    }).catchError((Error) {
      print(Error.toString());
      emit(getweatherErrorState());
    });
  }
 
  // getweather({required String cityname}) async {
  //   try {
  //     weatherModel weathermodel =
  //         await weatherServices(Dio()).getweather(cityname: cityname);
  //     print(weathermodel.city);
  //     print(weathermodel.date);
  //     emit(getweatherState(weathermodel));
  //   } catch (error) {
  //     emit(getweatherErrorState());
  //     print(error.toString());
  //   }
  // }
  
}

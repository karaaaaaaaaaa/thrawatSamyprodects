// ignore_for_file: unused_import

import 'package:app1/weather/model.dart';
import 'package:app1/weather/secoundmodel.dart';

class weatherStates {}

class initalState extends weatherStates {}

class weatherloadingState extends weatherStates {}

class getweatherState extends weatherStates {
  final Secoundmodel weathermodel;

  getweatherState(this.weathermodel);
}

class getweatherErrorState extends weatherStates {}
class colorState extends weatherStates {}

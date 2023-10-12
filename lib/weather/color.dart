import 'package:flutter/material.dart';


   MaterialColor getColorTheme(String ?condition) {
    if(condition==null){
       return Colors.blue;
    }
     switch (condition) {
    case 'sunny':
    case 'clear':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.blueGrey;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
    case 'mist':
      return Colors.blueGrey;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.blueGrey;
    case 'blizzard':
    case 'fog':
    case 'freezing fog':
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
      return Colors.lightBlue;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain at times':
      return Colors.lightBlue;
    case 'moderate rain':
      return Colors.lightBlue;
    case 'heavy rain at times':
      return Colors.lightBlue;
    case 'heavy rain':
      return Colors.lightBlue;
    case 'light freezing rain':
      return Colors.lightBlue;
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
      return Colors.lightBlue;
    case 'moderate or heavy sleet':
      return Colors.lightBlue;
    case 'patchy light snow':
      return Colors.lightBlue;
    case 'light snow':
      return Colors.lightBlue;
    case 'patchy moderate snow':
      return Colors.lightBlue;
    case 'moderate snow':
      return Colors.lightBlue;
    case 'patchy heavy snow':
      return Colors.lightBlue;
    case 'heavy snow':
      return Colors.lightBlue;
    case 'ice pellets':
      return Colors.lightBlue;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
      return Colors.lightBlue;
    case 'torrential rain shower':
      return Colors.lightBlue;
    case 'light sleet showers':
      return Colors.lightBlue;
    case 'moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'light snow showers':
      return Colors.lightBlue;
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'light showers of ice pellets':
      return Colors.lightBlue;
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey;
  }
}

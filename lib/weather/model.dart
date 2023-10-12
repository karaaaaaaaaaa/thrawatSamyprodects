// ignore_for_file: unused_local_variable

class weatherModel {
  final double maxtemp;
  final double mintemp;
  final double temp;
  final String? image;
  final String city;
  final String date;
  final String weathercondition;
// https://api.weatherapi.com/v1/forecast.json?key=cd321da97aac408f8fc125209231109&q=cario&aqi=no&alert=no
  weatherModel(
      {required this.maxtemp,
      required this.mintemp,
      required this.temp,
      required this.image,
      required this.city,
      required this.date,
      required this.weathercondition});
  factory weatherModel.fromJson(json) {
    return weatherModel(
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        city: json['location']['name'],
        date: json['current']['last_updated'],
        weathercondition: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}

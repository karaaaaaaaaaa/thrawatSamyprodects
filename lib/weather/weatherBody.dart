// ignore_for_file: unused_local_variable, unnecessary_null_comparison, unused_import

import 'package:app1/egyNews/componets.dart';
import 'package:app1/main.dart';
import 'package:app1/weather/color.dart';
import 'package:app1/weather/model.dart';
import 'package:app1/weather/search.dart';
import 'package:app1/weather/secoundmodel.dart';
import 'package:app1/weather/weatherCubit.dart';
import 'package:app1/weather/weatherstate.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class weatherBody extends StatelessWidget {
  const weatherBody({super.key, required this.weathermodel});
  final Secoundmodel weathermodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          // backgroundColor: Colors.black,
          elevation: 0,
          title: Text("Weather App "),
          actions: [
            IconButton(
                onPressed: () {
                  navigateTo(context, search());
                },
                icon: Icon(Icons.search))
          ]),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors:
       [
        getColorTheme(weatherCubit
                    .get(context)
                    .weathermodel
                    ?.forecast
                    .forecastday[0]
                    .day
                    .condition
                    .weathercondition),
                     getColorTheme(weatherCubit
                    .get(context)
                    .weathermodel
                    ?.forecast
                    .forecastday[0]
                    .day
                    .condition
                    .weathercondition)[300]!,
                     getColorTheme(weatherCubit
                    .get(context)
                    .weathermodel
                    ?.forecast
                    .forecastday[0]
                    .day
                    .condition
                    .weathercondition)[50]!,
        
       ],
      begin:Alignment.topCenter ,
      end: Alignment.bottomCenter,

         )),
    
    
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${weathermodel.location.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Last update : ${weathermodel.current.last_updated}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'http:${weathermodel.forecast.forecastday[0].day.condition.image}',
                    height: 100,
                    width: 100,
                    // fit: BoxFit.cover,
                  ),
                  Text(
                    '${weathermodel.forecast.forecastday[0].day.temp}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp:${weathermodel.forecast.forecastday[0].day.maxtemp}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Mintemp: ${weathermodel.forecast.forecastday[0].day.mintemp}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                '${weathermodel.forecast.forecastday[0].day.condition.weathercondition}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

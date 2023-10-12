// ignore_for_file: unused_local_variable, unused_import

import 'dart:developer';

import 'package:app1/egyNews/componets.dart';
import 'package:app1/main.dart';
import 'package:app1/weather/HomeWeather.dart';
import 'package:app1/weather/model.dart';

import 'package:app1/weather/weather%20services.dart';
import 'package:app1/weather/weatherBody.dart';
import 'package:app1/weather/weatherCubit.dart';
import 'package:app1/weather/weatherstate.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class search extends StatelessWidget {
  // const search({super.key});
  var searchcontr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var cubit = weatherCubit.get(context);
    return BlocProvider(
      create: (context) => weatherCubit(),
      child: BlocConsumer<weatherCubit, weatherStates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.black,
            elevation: 0,
            title: Text("Search City "),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: EdgeInsets.all(11),
              child: TextFormField(
                controller: searchcontr,
                onFieldSubmitted: (value) async {
                  weatherCubit.get(context).getweather(cityname: value);
                },
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text('search'),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(),
                    hintText: 'Enter a City Name',
                    suffixIcon: Icon(Icons.search)),
              ),
            )
          ]),
        ),
        listener: (context, state) {
          if (state is initalState) {
            navigateAndFinish(context, weatherhome());
          } else if (state is getweatherState) {
            // return navigateAndFinish(context, Counter());
       
            navigateAndFinish(
                context,
                weatherBody(
                  weathermodel: state.weathermodel,
                ));
          } else {
            Text("opps there are an error ");
          }
        },
      ),
    );
  }
}

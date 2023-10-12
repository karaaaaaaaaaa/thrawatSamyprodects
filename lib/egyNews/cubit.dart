// ignore_for_file: unused_import

import 'package:app1/egyNews/Science.dart';
import 'package:app1/egyNews/business.dart';
import 'package:app1/egyNews/dioHelper.dart';
import 'package:app1/egyNews/sports.dart';
import 'package:app1/egyNews/state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class newscubit extends Cubit<Cubitstate> {
  newscubit(Cubitstate initialState) : super(initialState);
  static newscubit get(context) => BlocProvider.of(context);
  int index = 0;

  List<Widget> body = [business(),
   SportsScreen(),
    science()];
  List<BottomNavigationBarItem> bottomlist = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  void bottommove(value) {
    index = value;
    emit(bottomnavstate());
  }

  // List<dynamic> bussiness = [];
  List<dynamic> bussiness = [];
  List<dynamic> sciences = [];
  List<dynamic> search = [];
  // https://gnews.io/api/v4/top-headlines?country=eg&category=sport&apikey=b6c932ce4ff392f5b4bc0df9375766ec

  // void getbussiness() {
  //   emit(businessLoadingstate());
  //   dioHelper.getData(path: 'api/v4/top-headlines', query: {
  //     'country': 'eg',
  //     'category': 'business',
  //     'apikey': 'b6c932ce4ff392f5b4bc0df9375766ec',
  //   }).then((value) {
  //     bussiness = value.data['articles'];
  //     print(bussiness[0]['title']);
  //     emit(businesssuccessstate());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(businessErrorstate());
  //   });
  // }
   void getbusiness() {
    emit(businessLoadingstate());
    dioHelper.getData(path: 'api/v4/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': 'b6c932ce4ff392f5b4bc0df9375766ec'
    }).then((value) {
      bussiness = value.data['articles'];
      emit(businesssuccessstate());
    }).catchError((error) {
      print(error.toString());
      emit(businessErrorstate(error.toString()));
    });
  }



  void getScience() {
    emit(NewsGetScienceLoadingState());

    dioHelper.getData(
        //  https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=c617c5f86f944aa3a7ff6c5f401e6a83
        path: 'api/v4/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apikey': 'b6c932ce4ff392f5b4bc0df9375766ec'
        }).then((value) {
      sciences = value.data['articles'];
      print(sciences[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }
   void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    dioHelper.getData(path: 'v4/everything', query: {
      'q': '$value',
      'apikey': 'b6c932ce4ff392f5b4bc0df9375766ec'
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}

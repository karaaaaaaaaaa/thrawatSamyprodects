import 'package:app1/egyNews/Science.dart';
import 'package:app1/egyNews/business.dart';
import 'package:app1/egyNews/dioHelper.dart';
import 'package:app1/egyNews/sports.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'news_state.dart';

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=c617c5f86f944aa3a7ff6c5f401e6a83
class NewsCubit extends Cubit<NewsStates> {
  NewsCubit(NewsStates initialState) : super(initialState);
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomVBINewsList = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    business(),
    SportsScreen(),
    science(),
  ];
  List<dynamic> bussiness = [];
  List<dynamic> sportss = [];
  List<dynamic> sciences = [];
  List<dynamic> search = [];
  // https://gnews.io/api/v4/top-headlines?country=eg&category=sport&apikey=b6c932ce4ff392f5b4bc0df9375766ec
  void getbusiness() {
    emit(NewsGetBusinessLoadingState());
    dioHelper.getData(path: 'api/v4/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': 'b6c932ce4ff392f5b4bc0df9375766ec'
    }).then((value) {
      bussiness = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }



  void getSports() {
    emit(NewsGetSportsLoadingState());
    dioHelper.getData(path: 'api/v4/top-headlines', query: {
      'country': 'eg',
      'category': 'sport',
      'apikey': 'b6c932ce4ff392f5b4bc0df9375766ec'
    }).then((value) {
      sportss = value.data['articles'];
      // print(sportss[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
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

  void changeNavBar(int index) {
    currentIndex = index;

    emit(NewsBottomNav());
  }
}

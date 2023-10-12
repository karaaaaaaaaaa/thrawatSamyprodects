// ignore_for_file: unused_import

import 'package:app1/chats/layout.dart';
import 'package:app1/chats/login.dart';
import 'package:app1/chats/loginCubit/logincubit.dart';
import 'package:app1/egyNews/bloc_observer.dart';
import 'package:app1/egyNews/componets.dart';
import 'package:app1/egyNews/cubit.dart';
import 'package:app1/egyNews/dioHelper.dart';
import 'package:app1/egyNews/layout.dart';
import 'package:app1/egyNews/news_cubit/news_cubit.dart';
import 'package:app1/egyNews/news_cubit/news_state.dart';
import 'package:app1/egyNews/state.dart';
import 'package:app1/languagelearning/languagelearning.dart';
import 'package:app1/news/views/home_view.dart';
import 'package:app1/noteapp/models/notesmodels.dart';
import 'package:app1/noteapp/moduels/homepage.dart';
import 'package:app1/noteapp/noteappCubit/noteappCubit.dart';
import 'package:app1/pointsCounter.dart';
import 'package:app1/shopApp/modules/Shophomepage.dart';
import 'package:app1/shopApp/netowork/remote/diohelperShop.dart';
import 'package:app1/shopApp/productCubit/productCubit.dart';
import 'package:app1/tunes/tunes.dart';
import 'package:app1/weather/HomeWeather.dart';
import 'package:app1/weather/color.dart';
import 'package:app1/weather/dio_helper.dart';
import 'package:app1/weather/search.dart';
import 'package:app1/weather/weatherBody.dart';
import 'package:app1/weather/weatherCubit.dart';
import 'package:app1/weather/weatherstate.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:app1/weather/weatherall.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(notemodelAdapter());
  await Hive.openBox<notemodel>("notes_box");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  dioWeatherHelper.init();
  DioHelperShop.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(NewsInitialState())
            ..getbusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => newscubit(initstate())
            ..getbusiness()
            ..getScience(),
        ),
        BlocProvider(create: (context) => weatherCubit()),
        BlocProvider(create: (context) => chatlogincubit()),
        BlocProvider(create: (context) => noteappCubit()),
        // BlocProvider(create: (context) => productCubit()..getproduct()),
        // //       ..getbussiness()
        // //       ..getScience()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.black)),
        home: Noteshomepage(),
      ),
    );
  }
}

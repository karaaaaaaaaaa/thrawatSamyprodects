// ignore_for_file: unused_import

import 'package:app1/egyNews/componets.dart';
import 'package:app1/egyNews/news_cubit/news_cubit.dart';
import 'package:app1/egyNews/news_cubit/news_state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        List businessList=NewsCubit.get(context).sportss;
        return listartical(businessList, context, listcount: 10, );
      },
    );
  }
}

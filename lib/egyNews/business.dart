// ignore_for_file: unused_import

import 'package:app1/egyNews/componets.dart';
import 'package:app1/egyNews/cubit.dart';
import 'package:app1/egyNews/news_cubit/news_cubit.dart';
import 'package:app1/egyNews/news_cubit/news_state.dart';
import 'package:app1/egyNews/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class business extends StatelessWidget {
  const business({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        List list= NewsCubit.get(context).bussiness;
    return    listartical(list, context, listcount: 10);
      },
      listener: (context, state) {},
    );
  }
}

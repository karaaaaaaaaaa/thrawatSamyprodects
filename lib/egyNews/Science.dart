import 'package:app1/egyNews/componets.dart';
import 'package:app1/egyNews/cubit.dart';
import 'package:app1/egyNews/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class science extends StatelessWidget {
  const science({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscubit, Cubitstate>(
      builder: (context, state) {
        List list = newscubit.get(context).sciences;
    return    listartical(list, context, listcount: 10);
      },
      listener: (context, state) {},
    );
  }
}
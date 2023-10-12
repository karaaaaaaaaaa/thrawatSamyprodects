import 'package:app1/egyNews/cubit.dart';
import 'package:app1/egyNews/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class layout extends StatelessWidget {
  const layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newscubit(initstate()),
      child: BlocConsumer<newscubit, Cubitstate>(
        builder: (context, state) {
          var cubit = newscubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Egypt News"),
            ),
            body: cubit.body[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.index,
                onTap: (value) => cubit.bottommove(value),
                items: cubit.bottomlist),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}

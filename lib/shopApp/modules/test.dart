// ignore_for_file: unnecessary_null_comparison

import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/productCubit/productCubit.dart';
import 'package:app1/shopApp/productCubit/productstate.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class producttest extends StatelessWidget {
  const producttest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productCubit()..getallproducts(),
      child: BlocConsumer<productCubit, productstate>(
        builder: (context, state) {
          var cubit = productCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
                ],
                backgroundColor: Colors.white,
                title: Text(
                  "New Trend",
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: ConditionalBuilder(
                condition: cubit.productList == null,
                builder: (context) {
                  print(cubit.productList.length);
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        itemCount: cubit.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) => defultCard(cubit.productList[index]),
                      ));
                },
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()),
              ));
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget defultCard(productmodel model) => Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 20,
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(1, 1)),
            ]),
            height: 160,
            // width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 1,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Shoes",
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                      Row(
                        children: [
                          Text(
                            "dd}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 46,
              top: -60,
              child: Image.network(
                "${model.image}",
                // "https://freepngimg.com/thumb/categories/627.png",
                height: 130,
              ))
        ],
      );
}

// ignore_for_file: body_might_complete_normally_catch_error

import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/netowork/remote/diohelperShop.dart';
import 'package:app1/shopApp/productCubit/productstate.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class productCubit extends Cubit<productstate> {
  productCubit() : super(initalstate());
  static productCubit get(context) => BlocProvider.of(context);
  List<productmodel> productList = [];
  // productmodel? model;
  getallproducts() async {
    emit(productloadingstate());
    DioHelperShop.getData(path: 'products').then((value) {
      // model = productmodel.fromjson(value.data);
      // productList.forEach((element) {
      //   productList.add(productmodel.fromjson(value));
      // });
      for (int i = 0; i < productList.length; i++) {
        productList.add(productmodel.fromjson(value.data[i]));
      }
      // print(productList[0].category);

      // print(productList[0].image);
      emit(productsucssessstate(model: productList));
      return productList;
    }).catchError((error) {
      print(error.toString());
      emit(producterrorstate(error: error.toString()));
    });
  }
}

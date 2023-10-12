

import 'package:app1/shopApp/netowork/remote/api.dart';

class Getallcagetgories{
   Future<List<dynamic>> getallcagetgories() async {
  List<dynamic> data = 
        await api().get(url: 'https://fakestoreapi.com/products/categories');
  
    // List<dynamic> data = jsonDecode(response.body);
   
    return data;
  }
}
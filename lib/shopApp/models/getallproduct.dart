
import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/netowork/remote/api.dart';


class allproduct {
  Future<List<productmodel>> getallproducts() async {
   List<dynamic> data = 
   await api().get(url: 'https://fakestoreapi.com/products');

    // List<dynamic> data = jsonDecode(response.body);
    List<productmodel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(productmodel.fromjson(data[i]));
    }
    return productlist;
  }
}

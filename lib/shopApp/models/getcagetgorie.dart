
import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/netowork/remote/api.dart';


class Getcagetgories {
  Future<List<productmodel>> getcategories({required String category_name}) async {
 List<dynamic> data =
        await api().get(url: 'https://fakestoreapi.com/products/category/$category_name');
    
    // List<dynamic> data = jsonDecode(response.body);
    List<productmodel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(productmodel.fromjson(data[i]));
    }
    return productlist;
  }
}

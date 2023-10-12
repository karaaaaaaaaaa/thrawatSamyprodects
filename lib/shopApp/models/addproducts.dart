import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/netowork/remote/api.dart';

class Addproducts {
  Future<productmodel> addproduct({
    required String title,
    required String price,
    required String image,
    required String description,
    required String category,
  }) async {
    Map<String, dynamic> data = await api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category
      },
    );
    return productmodel.fromjson(data);
  }
}

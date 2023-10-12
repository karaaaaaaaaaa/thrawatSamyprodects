import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/netowork/remote/api.dart';

class Updateproducts {
  Future<productmodel> updateproduct({
    required String title,
    required var price,
    required String image,
    required String description,
    String? category,
  }) async {
    Map<String, dynamic> data = await api().put(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category!
      },
    );
    print(data);
    return productmodel.fromjson(data);
  }
}

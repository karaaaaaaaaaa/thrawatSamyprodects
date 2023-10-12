
class productmodel {
  late int id;
  late String title;
  late var price;
  late String description;
  late String category;
  late String image;
  late ratingmodel rating;
  productmodel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = ratingmodel.fromjson(json['rating']);
  }
}

class ratingmodel {
  late int count;
  late var rate;
  ratingmodel.fromjson(Map<String, dynamic> json) {
    count = json['count'];
    rate = json['rate'];
  }
}

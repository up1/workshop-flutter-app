import 'package:mycart/product/model/product_model.dart';

class ProductResponseModel {
  final List<Product> products;

  ProductResponseModel({required this.products});

  factory ProductResponseModel.fromJson(List<dynamic> json) {
    List<Product> productsList = [];
    for (var item in json) {
      productsList.add(Product(name: item['title'], image: item['thumbnail']));
    }
    return ProductResponseModel(products: productsList);
  }
}

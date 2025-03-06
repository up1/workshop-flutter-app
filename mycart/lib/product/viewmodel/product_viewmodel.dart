import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mycart/product/data/product_remote_data.dart';
import 'package:mycart/product/model/product_model.dart';

class ProductViewModel with ChangeNotifier {
  List<Product> lists = List<Product>.empty(growable: true);

  ProductViewModel() {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final productResponse = await ProductRemoteDataSourceImpl(
      client: http.Client(),
    ).getProducts(limit: 5);
    lists = productResponse.products;
    notifyListeners();
  }

  List<Product> getAllProducts() {
    return lists;
  }
}

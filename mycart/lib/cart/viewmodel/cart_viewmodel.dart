import 'package:flutter/widgets.dart';
import 'package:mycart/product/model/product_model.dart';

class CartViewModel with ChangeNotifier {
  List<Product> lists = List<Product>.empty(growable: true);

  void add(String image, String name) {
    lists.add(Product(image: image, name: name));
    notifyListeners();
  }

  void del(int index) {
    if (index >= 0 && index < lists.length) {
      lists.removeAt(index);
      notifyListeners();
    }
  }

  void clear() {
    lists.clear();
    notifyListeners();
  }

  int get count => lists.length;

  Product get(int index) {
    return lists[index];
  }
}

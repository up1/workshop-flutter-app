import 'package:flutter/widgets.dart';
import 'package:demo02/model/product_model.dart';

class ProductsViewModel with ChangeNotifier {
  List<Products> lists = List<Products>.empty(growable: true);

  void add(String image, String name) {
    lists.add(Products(image: image, name: name));
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

  Products get(int index) {
    return lists[index];
  }
}

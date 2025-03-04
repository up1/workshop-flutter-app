import 'package:flutter/widgets.dart';
import 'package:demo02/model/product_model.dart';

class ProductsViewModel with ChangeNotifier {
  List<Products> lst = List<Products>.empty(growable: true);

  void add(String image, String name) {
    lst.add(Products(image: image, name: name));
    notifyListeners();
  }

  void del(int index) {
    if (index >= 0 && index < lst.length) {
      lst.removeAt(index);
      notifyListeners();
    }
  }
}

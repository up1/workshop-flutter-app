import 'package:flutter/widgets.dart';
import 'package:mycart/cart/service/cart_preferences.dart';
import 'package:mycart/product/model/product_model.dart';

class CartViewModel with ChangeNotifier {
  List<Product> lists = List<Product>.empty(growable: true);

  CartViewModel() {
    CartPreferences().loadCart().then((value) {
      lists = value as List<Product>;
      notifyListeners();
    });
  }

  void add(String image, String name) {
    lists.add(Product(image: image, name: name));
    CartPreferences().saveCart(lists);
    notifyListeners();
  }

  void del(int index) {
    if (index >= 0 && index < lists.length) {
      lists.removeAt(index);
      CartPreferences().saveCart(lists);
      notifyListeners();
    }
  }

  void clear() {
    lists.clear();
    CartPreferences().clearCart();
    notifyListeners();
  }

  int get count => lists.length;

  Product get(int index) {
    return lists[index];
  }
}

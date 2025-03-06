import 'dart:convert';

import 'package:mycart/product/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPreferences {
  // Save cart to shared preferences
  Future<void> saveCart(List<Product> products) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartList = [];
    for (var element in products) {
      cartList.add(jsonEncode(element.toJson()));
    }
    await prefs.setStringList('cart', cartList);
  }

  // Clear cart from shared preferences
  Future<void> clearCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart');
  }

  // Load cart from shared preferences
  Future<List<Product>> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartList = prefs.getStringList('cart');
    return cartList
            ?.map((item) => Product.fromJson(jsonDecode(item)))
            .toList() ??
        [];
  }
}

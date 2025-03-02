import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:demo01/item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Item> _cartItems = [];

  UnmodifiableListView get cartItems => UnmodifiableListView(_cartItems);

  double get price => _cartItems.fold<double>(
    0.0,
    (previousValue, element) => previousValue += element.price,
  );

  // Add Item
  void addItem(Item item) {
    _cartItems.add(item);
    notifyListeners();
    log("Item Added");
  }

  // Reset Cart
  void reset() {
    _cartItems.clear();
    notifyListeners();
  }
}

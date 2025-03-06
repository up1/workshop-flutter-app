import 'package:flutter/material.dart';
import 'package:mycart/product/view/screen/product_list_screen.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String productListingRoute = '/product_listing';
  static const String cartRoute = '/cart';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case productListingRoute:
        return MaterialPageRoute(builder: (_) => ProductScreen());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => ProductScreen());
      default:
        return MaterialPageRoute(builder: (_) => ProductScreen());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:mycart/cart/viewmodel/cart_viewmodel.dart';
import 'package:mycart/product/view/widget/cart_counter_widget.dart';
import 'package:mycart/product/view/widget/product_item_widget.dart';
import 'package:mycart/router.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  ProductScreenState createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        actions: [
          InkWell(
            key: Key("cart"),
            onTap: () {
              // Use app router to navigate to cart screen
              Navigator.push(
                context,
                AppRouter.generateRoute(
                  RouteSettings(name: AppRouter.cartRoute),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 0,
                right: 15,
                top: 8,
                bottom: 8,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Consumer<CartViewModel>(
                      builder:
                          (context, value, child) =>
                              CartCounter(count: value.count.toString()),
                    ), // Implement the CartCounter with state management
                  ),
                ],
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_rounded, color: Colors.blue, size: 25),
        ),
        title: Center(
          child: Text(
            key: Key("product_listing"),
            "Product Listing",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder:
                  (context, index) => ProductItem(
                    screenSize: screenSize,
                    image: products[index]["image"] ?? "",
                    itemName: products[index]["name"] ?? "",
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

// Mock data for testing
final products = [
  {
    "name": "Essence Mascara Lash Princess",
    "image":
        "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png",
  },
  {
    "name": "yeshadow Palette with Mirror",
    "image":
        "https://cdn.dummyjson.com/products/images/beauty/Eyeshadow%20Palette%20with%20Mirror/thumbnail.png",
  },
  {
    "name": "Powder Canister",
    "image":
        "https://cdn.dummyjson.com/products/images/beauty/Powder%20Canister/thumbnail.png",
  },
  {
    "name": "Red Lipstick",
    "image":
        "https://cdn.dummyjson.com/products/images/beauty/Red%20Lipstick/thumbnail.png",
  },
  {
    "name": "Red Nail Polish",
    "image":
        "https://cdn.dummyjson.com/products/images/beauty/Red%20Nail%20Polish/thumbnail.png",
  },
  {
    "name": "Calvin Klein CK One",
    "image":
        "https://cdn.dummyjson.com/products/images/fragrances/Calvin%20Klein%20CK%20One/thumbnail.png",
  },
];

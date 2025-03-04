import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo02/view/screen/cart.dart';
import 'package:demo02/view/widget/cart_counter.dart';
import 'package:demo02/view/widget/product_item.dart';
import 'package:demo02/viewmodel/products_viewmodel.dart';

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
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
                    child: Consumer<ProductsViewModel>(
                      builder:
                          (context, value, child) =>
                              CartCounter(count: value.lst.length.toString()),
                    ),
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
          child: Text("Demo of Products", style: TextStyle(color: Colors.blue)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height * 0.24,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prds.length,
              itemBuilder:
                  (context, index) => ProductItem(
                    screenSize: screenSize,
                    image: prds[index]["image"] ?? "",
                    itemName: prds[index]["name"] ?? "",
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

final prds = [
  {
    "name": "ABCD",
    "image":
        "https://lapntab.com/storage/app/public/images/products/oppo-a12_1.jpg",
  },
  {
    "name": "QQWE",
    "image":
        "https://lapntab.com/storage/app/public/images/products/oppo-f15_1.jpg",
  },
  {
    "name": "WWSA",
    "image":
        "https://lapntab.com/storage/app/public/images/products/reno-5_1.jpg",
  },
  {
    "name": "EXMP",
    "image":
        "https://lapntab.com/storage/app/public/images/products/apple-iphone-11-pro-64gb_1.jpg",
  },
  {
    "name": "SADS",
    "image":
        "https://lapntab.com/storage/app/public/images/products/hp-envy-13-ah1011tx-8th-gen_1.jpg",
  },
  {
    "name": "SADS",
    "image":
        "https://lapntab.com/storage/app/public/images/products/hp-pavilion-15-cs1034tx-i7_1.jpg",
  },
];

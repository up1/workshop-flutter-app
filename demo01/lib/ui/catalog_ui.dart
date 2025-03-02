import 'package:flutter/material.dart';
import 'package:demo01/constants.dart';
import 'package:demo01/ui/cart_ui.dart';
import 'package:demo01/ui/items_list.dart';
import 'package:demo01/ui/widget.dart';

class CatalogUI extends StatelessWidget {
  const CatalogUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Catalog"),
        centerTitle: true,
        actions: [
          InkWell(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                ),
            child: const Icon(Icons.shopping_cart),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: ListView.builder(
        itemCount: catalog.length,
        itemBuilder: (context, index) => ItemWidget(item: catalog[index]),
      ),
    );
  }
}

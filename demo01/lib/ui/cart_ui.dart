import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo01/cart_provider.dart';
import 'package:demo01/constants.dart';
import 'package:demo01/ui/widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Consumer<CartProvider>(
        builder:
            (context, provider, child) => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.cartItems.length,
                    itemBuilder:
                        (context, index) => ItemWidget(
                          isCartItem: true,
                          item: provider.cartItems[index],
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: () {},
                  child: Text("Buy ${provider.price} \$"),
                ),
                const SizedBox(height: 20),
              ],
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mycart/cart/view/widget/cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          key: Key("cart_title"),
          "Cart",
          style: TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SizedBox(
          height: screenSize.height,
          width: double.infinity,
          child: ListView.builder(
            key: Key("cart_list"),
            itemCount: 0,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                background: Container(
                  color: const Color.fromARGB(255, 240, 238, 238),
                ),
                onDismissed: (direction) {
                  // Delete item from cart
                },
                child: CartItem(
                  screenSize: screenSize,
                  image: "",
                  itemName: "",
                  del: () {
                    // Delete item from cart
                  },
                ),
              );
            },
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo02/view/widget/cart_item.dart';
import 'package:demo02/viewmodel/products_viewmodel.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Consumer<ProductsViewModel>(
      builder:
          (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text("Cart", style: TextStyle(color: Colors.blue)),
              backgroundColor: Colors.white,
            ),
            body: SafeArea(
              child: SizedBox(
                height: screenSize.height,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: value.lst.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.horizontal,
                      background: Container(
                        color: const Color.fromARGB(255, 240, 238, 238),
                      ),
                      onDismissed: (direction) {
                        value.del(index);
                      },
                      child: CartItem(
                        screenSize: screenSize,
                        image: value.lst[index].image,
                        itemName: value.lst[index].name,
                        del: value.del,
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ),
    );
  }
}

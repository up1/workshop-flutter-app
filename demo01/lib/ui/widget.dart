import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo01/cart_provider.dart';
import 'package:demo01/constants.dart';
import 'package:demo01/item_model.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item, this.isCartItem = false});
  final Item item;
  final bool isCartItem;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(color: item.color),
      ),
      title: Text(item.name),
      subtitle: Text("${item.price} \$"),
      trailing:
          isCartItem
              ? null
              : ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () => provider.addItem(item),
                child: const Text("Add"),
              ),
    );
  }
}

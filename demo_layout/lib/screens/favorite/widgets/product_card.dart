import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String originalPrice;
  final String discount;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(imageUrl, fit: BoxFit.contain),
              if (discount.isNotEmpty)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    color: Colors.yellow,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      discount,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ),
              Positioned(
                bottom: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Color(0xFF8CC63F),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(price, style: TextStyle(fontSize: 16, color: Colors.red)),
                if (originalPrice.isNotEmpty) ...[
                  SizedBox(width: 4),
                  Text(
                    originalPrice,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.motorcycle_outlined, size: 20),
                SizedBox(width: 10),
                Icon(Icons.local_shipping_outlined, size: 20),
                SizedBox(width: 10),
                Icon(Icons.storefront_outlined, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

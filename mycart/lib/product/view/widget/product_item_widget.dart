import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.screenSize,
    required this.image,
    required this.itemName,
  });

  final Size screenSize;
  final String image, itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize.height * 0.2,
      width: screenSize.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(33, 150, 243, 0.3),
            offset: Offset(0, 0),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              height: screenSize.height * 0.13,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              imageUrl: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                itemName,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ),
          InkWell(
            key: Key("add"),
            onTap: () {
              // TODO: Add item to cart
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: screenSize.height * 0.03,
                width: screenSize.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

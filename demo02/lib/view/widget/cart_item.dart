import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final Size screenSize;
  final String image, itemName;
  final Function del;

  const CartItem({
    super.key,
    required this.screenSize,
    required this.image,
    required this.itemName,
    required this.del,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: screenSize.height * 0.15,
      width: screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color:
                HSLColor.fromColor(
                  Colors.blue[200]!,
                ).withLightness(0.3).toColor(),
            offset: Offset(0, 0),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              height: screenSize.height * 0.13,
              width: screenSize.width * 0.3,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Center(child: CircularProgressIndicator()),
              imageUrl: image,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(itemName, style: TextStyle(fontSize: 22)),
          ),
        ],
      ),
    );
  }
}

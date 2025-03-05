import 'package:demo_layout/screens/cart/account_screen.dart';
import 'package:demo_layout/screens/favorite/widgets/product_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    // Return favorite screen text
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('ลิสต์ของฉัน', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              // Go to cart screen and move to router class
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.6,
          children: [
            ProductCard(
              imageUrl:
                  'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/10/88/8858868803910/8858868803910_1-20241127093934-.jpg',
              title: 'ยกซด ซอสผัดกะเพราสูตรเด็ก 200 มล.',
              price: '฿23.00 / ซอง',
              originalPrice: '',
              discount: '',
            ),
            ProductCard(
              imageUrl:
                  'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/catalog/product/10/88/8858868803910/8858868803910_1-20241127093934-.jpg',
              title: 'เด็กสมบูรณ์ ซีอิ๊วหวาน 400 ก.',
              price: '฿31.00 / ขวด',
              originalPrice: '฿37.00',
              discount: 'ลดไป 16%',
            ),
          ],
        ),
      ),
    );
  }
}

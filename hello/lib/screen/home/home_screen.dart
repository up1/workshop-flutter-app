import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hello/screen/noti/noti_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0003A),
      appBar: AppBar(
        backgroundColor: Color(0xFFB0003A),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'สวัสดีสมาชิก, 0863816736',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    'บิ๊กซี รัชดาภิเษก- prom condo 122/64 prom',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'ค้นหาสินค้า',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Image.network(
            //   'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202502/552fb3b1-2c95-485b-8b35-1f40e74b22f3.jpg',
            //   fit: BoxFit.cover,
            // ),
            CachedNetworkImage(
              imageUrl:
                  "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202502/552fb3b1-2c95-485b-8b35-1f40e74b22f3.jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureCard('บิ๊กพอยต์', 'เริ่มใช้งาน'),
                  _buildFeatureCard('คูปองของฉัน', 'เริ่มต้นใช้งาน'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconFeature(Icons.local_shipping, 'ส่งฟรี\nสั่งเลย!'),
                  _buildIconFeature(Icons.discount, 'ส่วนลด\nออนไลน์'),
                  _buildIconFeature(Icons.notifications, 'ภารกิจบิ๊กซี'),
                  _buildIconFeature(Icons.group, 'พาร์ทเนอร์'),
                  _buildIconFeature(Icons.store, 'ปรับปรุง\nออนไลน์'),
                ],
              ),
            ),
            Image.network(
              'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202502/552fb3b1-2c95-485b-8b35-1f40e74b22f3.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String title, String subtitle) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.green, fontSize: 18)),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildIconFeature(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.red, size: 30),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}

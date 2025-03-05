import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFB0003C),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'สวัสดีสมาชิค, 0863816736',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white, size: 16),
                Expanded(
                  child: Text(
                    'บิ๊กซี รัชดาภิเษก- prom condo 122/64 prom con',
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                    overflow:
                        TextOverflow.ellipsis, // Add ellipsis for long text
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.white),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFB0003C),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'ค้นหาสินค้า',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202411/d641d640-2cea-4101-a1c9-940be68a21e8.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFeatureButton('บิ๊กพอยต์', 'เริ่มใช้งาน'),
                  _buildFeatureButton('คูปองของฉัน', 'เริ่มต้นใช้งาน'),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildIconFeature(
                      'ส่งฟรี\nสั่งเลย!',
                      'assets/shipping.png',
                    ),
                    _buildIconFeature('ส่วนลด\nออนไลน์', 'assets/discount.png'),
                    _buildIconFeature(
                      'ภารกิจบิ๊กซี',
                      'assets/notification.png',
                    ),
                    _buildIconFeature('พาร์ทเนอร์', 'assets/partner.png'),
                    _buildIconFeature(
                      'ประกันภัย\nออนไลน์',
                      'assets/pickup_active.png',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202411/d641d640-2cea-4101-a1c9-940be68a21e8.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202411/d641d640-2cea-4101-a1c9-940be68a21e8.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202411/d641d640-2cea-4101-a1c9-940be68a21e8.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'บิ๊กพอยต์',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'สินค้า'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'ลิสต์ของฉัน',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'บัญชี'),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(128, 128, 128, 0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildIconFeature(String title, String imageUrl) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Image.asset(imageUrl, width: 60, height: 60),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

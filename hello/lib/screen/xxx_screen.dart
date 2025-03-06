import 'package:flutter/material.dart';

class XxxScreen extends StatelessWidget {
  const XxxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0003A),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
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
}

import 'package:flutter/material.dart';
import 'package:hello/screen/home/home_screen.dart';
import 'package:hello/screen/noti/noti_screen.dart';
import 'package:hello/screen/product/product_screen.dart';

class XxxScreen extends StatefulWidget {
  const XxxScreen({super.key});
  @override
  XxxScreenState createState() => XxxScreenState();
}

class XxxScreenState extends State<XxxScreen> {
  int _selectedTab = 0;

  final List<Widget> _tabs = [
    HomeScreen(),
    NotificationScreen(),
    ProductScreen(),
    NotificationScreen(),
    ProductScreen(),
  ];

  void _onClicked(int index, BuildContext context) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0003A),

      body: Container(padding: EdgeInsets.all(8), child: _tabs[_selectedTab]),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 69, 176, 39),
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
        currentIndex: _selectedTab,
        onTap: (index) {
          _onClicked(index, context);
        },
      ),
    );
  }
}

import 'package:demo_layout/screens/account/account_screen.dart';
import 'package:demo_layout/screens/favorite/favorite_screen.dart';
import 'package:demo_layout/screens/home/home_screen.dart';
import 'package:demo_layout/screens/point/point_screen.dart';
import 'package:demo_layout/screens/product/product_screen.dart';
import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  MainHomeScreenState createState() => MainHomeScreenState();
}

class MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> widgetOptions = const [
    HomeScreen(),
    PointScreen(),
    ProductScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Color.fromRGBO(206, 236, 80, 1),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'บิ๊กพอยต์',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'สินค้า',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'ลิสต์ของฉัน',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'บัญชี'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

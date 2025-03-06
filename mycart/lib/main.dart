import 'package:flutter/material.dart';
import 'package:mycart/product/view/screen/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo with MVVM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blueGrey[100],
        ),
        primaryColor: Colors.blue[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductScreen(),
    );
  }
}

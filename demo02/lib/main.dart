import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo02/view/screen/product_screen.dart';
import 'package:demo02/viewmodel/products_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductsViewModel()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

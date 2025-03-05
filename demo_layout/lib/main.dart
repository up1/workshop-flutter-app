import 'package:demo_layout/screens/main_home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:demo_layout/home_v1.dart';

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
      // home: const HomePageV1(),
      home: const MainHomeScreen(),
    );
  }
}

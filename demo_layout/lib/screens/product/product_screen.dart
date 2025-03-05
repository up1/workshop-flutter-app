import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    // Return product screen text
    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: Center(child: const Text('Hello, this is the product screen!')),
    );
  }
}

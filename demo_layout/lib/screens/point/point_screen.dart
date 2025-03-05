import 'package:flutter/material.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    // Return hello text
    return Scaffold(
      appBar: AppBar(title: const Text('Point')),
      body: Center(child: const Text('Hello, this is the point screen!')),
    );
  }
}

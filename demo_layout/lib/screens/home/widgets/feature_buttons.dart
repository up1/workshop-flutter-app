import 'package:flutter/material.dart';

class FeatureButtons extends StatelessWidget {
  const FeatureButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFeatureButton('บิ๊กพอยต์', 'เริ่มใช้งาน'),
          _buildFeatureButton('คูปองของฉัน', 'เริ่มต้นใช้งาน'),
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
}

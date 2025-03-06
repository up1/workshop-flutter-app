import 'package:flutter/material.dart';

class StarterWidget extends StatelessWidget {
  const StarterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFeatureCard('บิ๊กพอยต์', 'เริ่มใช้งาน'),
          _buildFeatureCard('คูปองของฉัน', 'เริ่มต้นใช้งาน'),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String subtitle) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.green, fontSize: 18)),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(color: Colors.black, fontSize: 16)),
        ],
      ),
    );
  }
}

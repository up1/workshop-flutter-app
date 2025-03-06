import 'package:flutter/material.dart';

class PromotionsWidget extends StatelessWidget {
  const PromotionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconFeature(Icons.local_shipping, 'ส่งฟรี\nสั่งเลย!'),
          _buildIconFeature(Icons.discount, 'ส่วนลด\nออนไลน์'),
          _buildIconFeature(Icons.notifications, 'ภารกิจบิ๊กซี'),
          _buildIconFeature(Icons.group, 'พาร์ทเนอร์'),
          _buildIconFeature(Icons.store, 'ปรับปรุง\nออนไลน์'),
        ],
      ),
    );
  }

  Widget _buildIconFeature(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.red, size: 30),
        ),
        SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}

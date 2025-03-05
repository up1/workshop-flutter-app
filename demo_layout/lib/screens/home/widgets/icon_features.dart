import 'package:flutter/material.dart';

class IconFeatures extends StatelessWidget {
  const IconFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildIconFeature('ส่งฟรี\nสั่งเลย!', 'assets/shipping.png'),
            _buildIconFeature('ส่วนลด\nออนไลน์', 'assets/discount.png'),
            _buildIconFeature('ภารกิจบิ๊กซี', 'assets/notification.png'),
            _buildIconFeature('พาร์ทเนอร์', 'assets/partner.png'),
            _buildIconFeature('ประกันภัย\nออนไลน์', 'assets/pickup_active.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildIconFeature(String title, String imageUrl) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Image.asset(imageUrl, width: 60, height: 60),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

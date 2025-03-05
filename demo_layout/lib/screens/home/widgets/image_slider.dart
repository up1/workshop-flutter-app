import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _buildSliderImage(context),
            const SizedBox(width: 10),
            _buildSliderImage(context),
            const SizedBox(width: 10),
            _buildSliderImage(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderImage(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202411/d641d640-2cea-4101-a1c9-940be68a21e8.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}

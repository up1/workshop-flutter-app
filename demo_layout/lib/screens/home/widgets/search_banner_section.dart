import 'package:flutter/material.dart';

class SearchBannerSection extends StatelessWidget {
  const SearchBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFB0003C),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'ค้นหาสินค้า',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Image.network(
            'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202411/d641d640-2cea-4101-a1c9-940be68a21e8.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

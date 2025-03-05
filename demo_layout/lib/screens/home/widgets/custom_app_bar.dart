import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFB0003C),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'สวัสดีสมาชิค, 0863816736',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 16),
              Expanded(
                child: Text(
                  'บิ๊กซี รัชดาภิเษก- prom condo 122/64 prom con',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

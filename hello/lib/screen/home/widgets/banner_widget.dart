import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202502/552fb3b1-2c95-485b-8b35-1f40e74b22f3.jpg",
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

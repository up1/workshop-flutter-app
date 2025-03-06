import 'package:flutter/material.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/search_widget.dart';
import 'widgets/banner_widget.dart';
import 'widgets/starter_widget.dart';
import 'widgets/promotions_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0003A),
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchWidget(),
            BannerWidget(),
            StarterWidget(),
            PromotionsWidget(),
            Image.network(
              'https://st.bigc-cs.com/cdn-cgi/image/format=webp,quality=90/public/media/banner/th/202502/552fb3b1-2c95-485b-8b35-1f40e74b22f3.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

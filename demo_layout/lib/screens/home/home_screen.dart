import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/search_banner_section.dart';
import 'widgets/feature_buttons.dart';
import 'widgets/icon_features.dart';
import 'widgets/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBannerSection(),
            FeatureButtons(),
            IconFeatures(),
            SizedBox(height: 10),
            ImageSlider(),
          ],
        ),
      ),
    );
  }
}

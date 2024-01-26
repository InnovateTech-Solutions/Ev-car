import 'package:flutter/material.dart';
import '../widget/ads_widget.dart';
import '../widget/custom_app_bar_ads.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBarAds(),
      body: AdeWidget(),
    );
  }
}

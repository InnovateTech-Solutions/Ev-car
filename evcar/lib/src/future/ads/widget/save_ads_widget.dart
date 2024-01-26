import 'package:evcar/src/future/ads/widget/custom_app_bar_ads.dart';
import 'package:flutter/material.dart';

class SaveAdsWidget extends StatelessWidget {
  const SaveAdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarAds(),
      body: Column(),
    );
  }
}

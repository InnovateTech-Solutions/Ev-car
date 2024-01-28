import 'package:evcar/src/feature/ads/view/widget/main/ads_widget.dart';
import 'package:evcar/src/feature/ads/view/widget/widget_collection/ads_appbar.dart';
import 'package:flutter/material.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AdsAppBar.appBar(),
        backgroundColor: Color(0xffE8E7ED),
        body: AdsWidget(),
      ),
    );
  }
}

import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/vendor_map/view/page/vendor_map_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.number});
  final String number;
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(
        const VendorMapPage(
          number: '',
        ),
        transition: Transition.fade,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppTheme.lightAppColors.buttoncolor, size: 150),
          ),
        ),
      ),
    );
  }
}

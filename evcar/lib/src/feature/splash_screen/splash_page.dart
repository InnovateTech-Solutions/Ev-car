import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/on_board/view/pages/onboard_page.dart';
import 'package:evcar/src/feature/splash_screen/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(
        const OnBoardPage(),
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
      backgroundColor: AppTheme.lightAppColors.primary,
      body: const Center(child: SplashWidget()),
    ));
  }
}

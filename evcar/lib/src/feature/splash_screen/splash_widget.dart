import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/on_board/view/text_widget/on_boarding_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../on_board/view/pages/onboard_page.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(
        const OnBoardPage(),
        transition: Transition.fade,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: context.screenWidth,
          height: context.screenHeight * 0.6,
          decoration: BoxDecoration(
              color: AppTheme.lightAppColors.primary,
              image: const DecorationImage(
                  image: AssetImage("assets/images/splashImage.png"),
                  fit: BoxFit.cover)),
        ),
        Image.asset(
          "assets/images/logo.png",
          width: 0.2 * context.screenWidth,
        ),
        splashMainText("مرحبا بك في تطبيق"),
        blueText("السيارت الكهربائية"),
        splashSecText("جميع الخدمات لسيارتك الكهربائية شراء صيانة وشحن "),
      ],
    );
  }
}

import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/future/on_board/view/widget/on_boarding_text_widget.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/splashImage.png",
          // height: 0.5 * context.screenHeight,
          width: context.screenWidth,
        ),
        Image.asset(
          "assets/images/logo.png",
          width: 0.2 * context.screenWidth,
        ),
        mainText("مرحبا بك في تطبيق"),
        blueText("السيارت الكهربائية"),
        secText("جميع الخدمات لسيارتك الكهربائية شراء صيانة وشحن "),
      ],
    );
  }
}

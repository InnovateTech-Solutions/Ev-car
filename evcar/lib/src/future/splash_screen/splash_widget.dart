import 'package:evcar/src/future/on_board/view/widget/on_boarding_text_widget.dart';
import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/splashImage.png",
        ),
        Image.asset(
          "assets/images/logo.png",
          width: 0.35 * screenWidth,
        ),
        mainText("مرحبا بك في تطبيق"),
        blueText("السيارت الكهربائية"),
        secText("جميع الخدمات لسيارتك الكهربائية شراء صيانة وشحن "),
      ],
    );
  }
}

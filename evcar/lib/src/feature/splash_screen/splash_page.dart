import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/pages/Intro_page.dart';
import 'package:evcar/src/feature/on_board/controller/on_board_controller.dart';
import 'package:evcar/src/feature/splash_screen/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Get.put(OnboardingController());
  @override
  void initState() {
    print(controller.isFirstTime.value);
    controller.checkFirstTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.isFirstTime.value == true) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: AppTheme.lightAppColors.primary,
        body: const SplashWidget(),
      ));
    } else {
      return IntroPage();
    }
  }
}

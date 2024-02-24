import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/pages/Intro_page.dart';
import 'package:evcar/src/feature/on_board/view/main_widget/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/on_board_controller.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    if (controller.isFirstTime.value == true) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppTheme.lightAppColors.buttoncolor,
          body: OnBoardingWidget(),
        ),
      );
    } else {
      return IntroPage();
    }
  }
}

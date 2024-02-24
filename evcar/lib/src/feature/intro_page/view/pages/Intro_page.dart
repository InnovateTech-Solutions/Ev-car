import 'package:evcar/src/feature/intro_page/view/main_widget/Intro_widget.dart';
import 'package:evcar/src/feature/on_board/controller/on_board_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final controller = Get.put(OnboardingController());

  void initState() {
    super.initState();
    print(controller.isFirstTime.value);
    controller.checkFirstTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: IntroWidget(),
      ),
    );
  }
}

import 'package:evcar/src/feature/intro_page/view/pages/Intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;
  RxBool isFirstTime = true.obs;

  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTimee = prefs.getBool('isFirstTime')!;

    isFirstTime.value = isFirstTimee;
  }

  Future<void> completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);

    isFirstTime.value = false;
  }

  double get progress => currentPageIndex.value / 2;

  void nextPage() {
    if (currentPageIndex.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Get.offAll(const IntroPage());
    }
  }

  Color getIconColor(int currentIndex) {
    if (currentIndex == 0) {
      return const Color(0xffF2D478);
    } else if (currentIndex == 1) {
      return const Color(0xffB7ABFC);
    } else if (currentIndex == 2) {
      return const Color(0xff95B6FF);
    } else {
      return const Color(0xffffffff);
    }
  }
}

import 'package:evcar/src/future/google_map/view/pages/google_map_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPageIndex = 0.obs;

  double get progress => currentPageIndex.value / 2;

  void nextPage() {
    if (currentPageIndex.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Get.to(const GoogleMapPage());
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

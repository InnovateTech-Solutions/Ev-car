import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/on_board/controller/on_board_controller.dart';
import 'package:evcar/src/feature/on_board/view/widget/on_boarding_text_widget.dart';
import 'package:evcar/src/feature/opening_screen/view/pages/opening_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

onBaordingButton(OnboardingController controller, BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Container(
    margin: EdgeInsets.only(
        left: 0.05 * screenWidth,
        right: 0.05 * screenWidth,
        bottom: 0.05 * screenWidth),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                dotColor: Colors.white.withOpacity(.5),
                activeDotColor: AppTheme.lightAppColors.background,
                dotHeight: 0.02 * screenWidth,
                dotWidth: 0.02 * screenWidth,
              ),
              controller: controller.pageController,
              count: 3,
            ),
            SizedBox(
              height: 0.02 * screenWidth,
            ),
            GestureDetector(
              onTap: () {
                Get.offAll(const OpeningPage());
              },
              child: thirdText("Skip"),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 0.17 * screenWidth,
              height: 0.17 * screenWidth,
              child: CircularProgressIndicator(
                backgroundColor: const Color.fromARGB(84, 255, 255, 255),
                value: controller.progress,
                strokeWidth: 0.01 * screenWidth,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.lightAppColors.mainTextcolor,
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.nextPage,
              child: Container(
                width: 0.13 * screenWidth,
                height: 0.13 * screenWidth,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.lightAppColors.mainTextcolor,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: controller
                      .getIconColor(controller.currentPageIndex.value),
                  size: 0.05 * screenWidth,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

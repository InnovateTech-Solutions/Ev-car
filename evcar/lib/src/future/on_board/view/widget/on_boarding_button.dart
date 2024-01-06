import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/future/on_board/controller/on_board_controller.dart';
import 'package:evcar/src/future/on_board/view/widget/on_boarding_text_widget.dart';
import 'package:evcar/src/future/opening_screen/view/pages/opening_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

onBaordingButton(OnboardingController controller, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
        left: 0.05 * context.screenWidth,
        right: 0.05 * context.screenWidth,
        bottom: 0.01 * context.screenHeight),
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
                dotHeight: 0.01 * context.screenHeight,
                dotWidth: 0.02 * context.screenWidth,
              ),
              controller: controller.pageController,
              count: 3,
            ),
            SizedBox(
              height: 0.01 * context.screenHeight,
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
              width: 0.17 * context.screenWidth,
              height: 0.17 * context.screenWidth,
              child: CircularProgressIndicator(
                backgroundColor: const Color.fromARGB(84, 255, 255, 255),
                value: controller.progress,
                strokeWidth: 0.01 * context.screenWidth,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.lightAppColors.mainTextcolor,
                ),
              ),
            ),
            GestureDetector(
              onTap: controller.nextPage,
              child: Container(
                width: 0.13 * context.screenWidth,
                height: 0.07 * context.screenHeight,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.lightAppColors.mainTextcolor,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: controller
                      .getIconColor(controller.currentPageIndex.value),
                  size: 0.05 * context.screenWidth,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

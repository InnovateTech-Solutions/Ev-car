import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/pages/Intro_page.dart';
import 'package:evcar/src/feature/on_board/controller/on_board_controller.dart';
import 'package:evcar/src/feature/on_board/view/text_widget/on_boarding_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

onBaordingButton(BuildContext context) {
  final controller = Get.put(OnboardingController());
  final ccontroller = Get.put(OnboardingController());

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
                ccontroller.completeOnboarding();
                Get.offAll(IntroPage());
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
                value: 1,
                strokeWidth: 0.01 * context.screenWidth,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.lightAppColors.mainTextcolor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.nextPage();
                ccontroller.completeOnboarding();
              },
              child: Container(
                width: 0.13 * context.screenWidth,
                height: 0.07 * context.screenHeight,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.lightAppColors.mainTextcolor,
                ),
                child: Obx(
                  () => Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: controller
                        .getIconColor(controller.currentPageIndex.value),
                    size: 0.05 * context.screenWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

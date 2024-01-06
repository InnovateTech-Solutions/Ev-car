import 'package:evcar/src/config/theme/sizes.dart';
import 'package:evcar/src/feature/on_board/view/widget/on_boarding_button.dart';
import 'package:evcar/src/feature/on_board/view/widget/on_boarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(OnboardingController());
    return
        // Expanded(
        //     child: PageView(
        //   controller: controller.pageController,
        //   onPageChanged: (index) {
        //     controller.currentPageIndex.value = index;
        //   },
        //   children: [
        // OnBoardingWidgets(
        //   title: "صيانة السيارات الكهربائية",
        //   secText: "قم بصيانة سيارتك في افضل مراكز الصيانة\n",
        //   image: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       SvgPicture.asset("assets/images/onBoarding1.svg",
        //           height: context.screenWidth > 375
        //               ? 0.5 * context.screenHeight
        //               : 0.4 * context.screenHeight,
        //           width: context.screenWidth > 375
        //               ? 0.5 * context.screenWidth
        //               : 0.3 * context.screenWidth),
        //     ],
        //   ),
        // ),
        Column(
      children: [
        Expanded(
          child: OnBoardingWidgets(
            title: "شحن السيارات الكهربائية",
            secText:
                "قم بالبحث عن اقرب نقاط شحن سيارتك الثابتة او احجز مع خدمة الشحن المتنقل",
            image: SvgPicture.asset("assets/images/onBoarding2.svg",
                height: context.screenWidth > 375
                    ? 0.5 * context.screenHeight
                    : 0.4 * context.screenHeight,
                width: context.screenWidth > 375
                    ? 0.5 * context.screenWidth
                    : 0.3 * context.screenWidth),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            onBaordingButton(context),
          ],
        )
      ],
      // OnBoardingWidgets(
      //   title: "شراء وبيع السيارات الكهربائية",
      //   secText:
      //       "قم بتصفح وشراء السيارات الكهربائية ومعرفة جميع مواصفاتها في مكان واحد ",
      //   image: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       SvgPicture.asset("assets/images/onBoarding3.svg",
      //           height: context.screenWidth > 375
      //               ? 0.5 * context.screenHeight
      //               : 0.4 * context.screenHeight,
      //           width: context.screenWidth > 375
      //               ? 0.5 * context.screenWidth
      //               : 0.3 * context.screenWidth),
      //     ],
      //   ),
      // ),
      //   ],
      // )),
    );
  }
}

import 'package:evcar/src/feature/on_board/controller/on_board_controller.dart';
import 'package:evcar/src/feature/on_board/view/widget/on_boarding_button.dart';
import 'package:evcar/src/feature/on_board/view/widget/on_boarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Obx(() => Column(
          children: [
            Expanded(
                child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.currentPageIndex.value = index;
              },
              children: const [
                OnBoardingWidgets(
                    title: "صيانة السيارات الكهربائية",
                    secText: "قم بصيانة سيارتك في افضل مراكز الصيانة\n",
                    image: "assets/images/onBoarding1.svg"),
                OnBoardingWidgets(
                    title: "شحن السيارات الكهربائية",
                    secText:
                        "قم بالبحث عن اقرب نقاط شحن سيارتك الثابتة او احجز مع خدمة الشحن المتنقل",
                    image: "assets/images/onBoarding2.svg"),
                OnBoardingWidgets(
                    title: "شراء وبيع السيارات الكهربائية",
                    secText:
                        "قم بتصفح وشراء السيارات الكهربائية ومعرفة جميع مواصفاتها في مكان واحد ",
                    image: "assets/images/onBoarding3.svg"),
              ],
            )),
            onBaordingButton(controller, context),
          ],
        ));
  }
}

import 'package:evcar/src/config/routes/routes.dart';
import 'package:evcar/src/config/sizes/sizes.dart';
import 'package:evcar/src/config/theme/theme.dart';
import 'package:evcar/src/feature/intro_page/view/text_widget/opeing_text.dart';
import 'package:evcar/src/feature/intro_page/view/widget_collection/intro_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: context.screenHeight * 0.11),
      child: Center(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/photo2.png'),
            ),
            IntroText.mainIntroText('استكشف التطبيق'),
            IntroText.subIntroText(
                'جميع الخدمات لسيارتك في مكان واحد \nصيانة-وشحن-شراء'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            IntroPageButton(
              colorText: AppTheme.lightAppColors.background,
              colorButton: AppTheme.lightAppColors.buttoncolor,
              text: 'تسجيل دخول',
              onPressed: () => Get.toNamed(AppRoutes.login),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 45,
            ),
            IntroPageButton(
              colorButton: AppTheme.lightAppColors.background,
              colorText: AppTheme.lightAppColors.buttoncolor,
              text: 'إنشاء حساب',
              onPressed: () => Get.toNamed(AppRoutes.register),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/future/login/view/pages/login_page.dart';
import 'package:evcar/src/future/register/view/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widget/text_widget/text_widget.dart';

class OpeningWidget extends StatelessWidget {
  const OpeningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .13,
        ),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/photo1.png'),
            ),
            Styles.textstyle30('استكشف التطبيق'),
            Styles.textstyle16(
              'جميع الخدمات لسيارتك في مكان واحد \nصيانة-وشحن-شراء',
              const Color.fromRGBO(0, 0, 0, 7),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            CustemButton(
              colorText: Colors.white,
              colorButton: const Color.fromRGBO(0, 168, 168, 1),
              text: 'تسجيل دخول',
              onPressed: () {
                Get.to(const LoginPage());
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .019,
            ),
            CustemButton(
              colorButton: Colors.white,
              colorText: const Color.fromRGBO(0, 168, 168, 1),
              text: 'إنشاء حساب',
              onPressed: () {
                Get.to(const RegisterPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

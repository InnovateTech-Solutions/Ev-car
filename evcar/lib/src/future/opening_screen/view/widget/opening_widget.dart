import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/future/login/view/pages/login_page.dart';
import 'package:evcar/src/future/login/view/widget/login_text.dart';
import 'package:evcar/src/future/register/view/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpeningWidget extends StatelessWidget {
  const OpeningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height / 8),
        child: Center(
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/images/photo2.png'),
              ),
              LoginText.mainText('استكشف التطبيق'),
              LoginText.secText(
                  'جميع الخدمات لسيارتك في مكان واحد \nصيانة-وشحن-شراء'),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
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
                height: MediaQuery.of(context).size.height / 45,
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
      ),
    );
  }
}

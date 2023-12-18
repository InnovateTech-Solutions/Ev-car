import 'package:evcar/src/core/widgets/custem_button.dart';
import 'package:evcar/src/core/widgets/custem_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_title_text2.dart';
import '../../../../core/widgets/dividerHorizontal.dart';
import '../../../../core/widgets/dividerVertical.dart';
import '../pages/complete_phone.dart';
import 'custem_text.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        right: 10,
        left: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustemTitleText(text: 'تسجيل الدخول'),
            SizedBox(
              height: Get.height / 49,
            ),
            const CustomTitleText2(
              text: 'يرجى تأكيد رمز البلد الخاص بك وإدخال رقم هاتفك.',
            ),
            SizedBox(
              height: Get.height / 20,
            ),
            const MyDividerHorizontal(),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: CustemText(
                text: 'الاردن',
              ),
            ),
            const MyDividerHorizontal(),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    textAlign: TextAlign.end,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: '00 00 00 00 0',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const MyDividerVertical(),
                const CustemText(text: '962+'),
              ],
            ),
            const MyDividerHorizontal(),
            SizedBox(
              height: Get.height / 10,
            ),
            CustemButton(
              text: 'التالي',
              onPressed: () {
                Get.to(const CompletePhone());
              },
              colorText: Colors.white,
              colorButton: const Color.fromRGBO(0, 168, 168, 1),
            )
          ],
        ),
      ),
    );
  }
}
